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
  }) {
    return ErrorHandler.catchException(
      () async {
        final response = await request();
        ApiResponse apiResponse = ApiResponse.fromResponse(response);
        final apiData = apiResponse.data;
        T? data;

        if (!apiResponse.success) {
          return FailureState<T>(error: apiResponse.message);
        } else if (fromJson == null) {
          return SuccessState(data: data);
        } else if (apiData is MapDynamic) {
          data = fromJson(apiData) as T;
        } else if (apiData is List) {
          data = apiData.map((json) => fromJson(json)).toList() as T;
        }

        return SuccessState(data: data);
      },
    );
  }
}
