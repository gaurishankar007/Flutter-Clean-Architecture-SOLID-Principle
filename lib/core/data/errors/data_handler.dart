import 'dart:developer' show log;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/services.dart' show PlatformException;

import '../../utils/type_defs.dart';
import '../api/api_response.dart';
import '../states/data_state.dart';

part 'error_handler.dart';
part 'error_types.dart';

/// Handles flutter, api, local database errors and returns suitable [DataState]
/// Checks for internet connection and returns suitable [DataState]
class DataHandler {
  DataHandler._();

  /// Executes [remoteCallback] if internet is available.
  /// If successful and [successCallback] is provided, it gets called with the result.
  /// If offline, executes [localCallback] if provided; otherwise returns [NoInternetState].
  static FutureData<T> fetchWithFallback<T>(
    bool isInternetConnected, {
    required FutureData<T> Function() remoteCallback,
    Function(T data)? successCallback,
    FutureData<T> Function()? localCallback,
  }) async {
    if (isInternetConnected) {
      final dataState = await remoteCallback();
      final data = dataState.data;

      if (data != null && successCallback != null) successCallback(data);
      return dataState;
    }

    return localCallback != null ? await localCallback() : NoInternetState();
  }

  /// Executes an API request while handling network errors, formatting issues,
  /// and response parsing. Wraps the result in a [FutureData] state:
  /// [SuccessState] on success, or an appropriate [FailureState] on error.
  ///
  /// Type [T] is the final return type of the API call (e.g., a model or list of models).
  /// Type [R] is the raw deserialization type used in [fromJson]. Typically, [T] and [R]
  /// are the same when returning a single model. When returning a list of models,
  /// [T] would be `List<R>`.
  ///
  /// Parameters:
  /// - [request]: A function that performs the actual API request.
  /// - [fromJson]: A deserialization function to convert JSON (Map) into an object of type [R].
  /// - [isStandardResponse]: If `true`, assumes the API response is wrapped in a standard
  ///   structure (e.g., `{ data: ..., message: ... }`) and extracts the inner `data` field.
  /// - [staticData]: Optional custom value to return instead of processing the API response.
  ///   Useful when you want to bypass parsing and directly return a predefined value.
  static FutureData<T> safeApiCall<T, R>({
    required Future<Response> Function() request,
    R Function(MapDynamic json)? fromJson,
    bool isStandardResponse = true,
    T? staticData,
  }) {
    return ErrorHandler.catchException(() async {
      final response = await request();
      Object? rawData = response.data;
      bool isSuccess = true;
      String? message;
      T? data;

      /// Handle standard API structure
      if (isStandardResponse) {
        ApiResponse apiResponse = ApiResponse.fromResponse(response);
        isSuccess = apiResponse.success;
        message = apiResponse.message;
        rawData = apiResponse.data;
      }

      /// If api response did not succeeded
      if (!isSuccess) {
        return FailureState<T>(
          message: message,
          statusCode: response.statusCode,
        );
      }
      if (staticData != null) {
        data = staticData;
      } else if (fromJson != null) {
        if (rawData is MapDynamic) {
          data = fromJson(rawData) as T;
        } else if (rawData is List) {
          data = rawData.map((json) => fromJson(json)).toList() as T;
        } else {
          throw FormatException(
            'Expected Map or List but got ${rawData.runtimeType}.',
          );
        }
      } else if (rawData is List) {
        data = rawData.map((e) => e as R).toList() as T;
      } else if (rawData is T) {
        data = rawData;
      }

      return SuccessState(
        data: data,
        message: message,
        statusCode: response.statusCode,
      );
    });
  }
}
