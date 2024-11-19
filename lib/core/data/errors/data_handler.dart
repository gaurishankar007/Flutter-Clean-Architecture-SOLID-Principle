import 'dart:developer' show log;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import '../../utils/type_defs.dart';
import '../api/api_response.dart';
import '../states/data_state.dart';

part 'error_handler.dart';
part 'error_types.dart';

/// Handles flutter, api, local database errors and returns suitable [DataState]
/// Checks for internet connection and returns suitable [DataState]
class DataHandler {
  DataHandler._();

  /// Checks internet connection before performing the task [remoteCallback].
  /// If internet is available and the performed task is success state,
  /// then performs another task [successCallback] if it is provided.
  /// If internet is not available, performs another task [localCallback]
  /// only if it is provided. Otherwise, it returns [InternetUnavailableState]
  static FutureData<T> guardNetwork<T>(
    bool isInternetConnected, {
    required FutureData<T> Function() remoteCallback,
    Function(T? data)? successCallback,
    FutureData<T> Function()? localCallback,
  }) async {
    /// If internet is available
    if (isInternetConnected) {
      final dataState = await remoteCallback();
      if (successCallback != null && dataState is SuccessState) {
        successCallback(dataState.data);
      }
      return dataState;
    }

    /// If internet is not available
    if (localCallback == null) return InternetUnavailableState<T>();
    return await localCallback();
  }

  /// Handles Dio, Type, Format, and other errors while performing api request
  /// and returns the respective [FailureState]. If there is no errors, then
  /// returns [SuccessState].
  ///
  /// Type [T] is the function's return type and Type [R] is the fromJson
  /// function return type. [T] and [R] could be the same if the function is
  /// returning a model or [T] could be List<[R]> if the function is returning
  /// a list of model.
  static FutureData<T> requestApi<T, R>({
    required Future<Response> Function() request,
    R Function(MapDynamic json)? fromJson,
    bool isStructuredResponse = true,
  }) {
    return ErrorHandler.catchException(
      () async {
        final response = await request();
        Object? apiRawData = response.data;
        bool isSuccess = true;
        String message = "";
        T? data;

        /// Whether the response data is in a fixed structured format or not.
        if (isStructuredResponse) {
          ApiResponse apiResponse = ApiResponse.fromResponse(response);
          isSuccess = apiResponse.success;
          message = apiResponse.message;
          apiRawData = apiResponse.data;
        }

        /// If api response did not succeeded
        if (!isSuccess) return FailureState<T>(error: message);

        if (fromJson != null) {
          if (apiRawData is MapDynamic) {
            data = fromJson(apiRawData) as T;
          } else if (apiRawData is List) {
            data = apiRawData.map((json) => fromJson(json)).toList() as T;
          } else {
            /// Return custom data if api data is neither map or list
            data = fromJson({}) as T;
          }
        } else if (apiRawData is List) {
          data = apiRawData.map((e) => e as R).toList() as T;
        } else if (apiRawData is T) {
          data = apiRawData;
        }

        return SuccessState(data: data, message: message);
      },
    );
  }
}
