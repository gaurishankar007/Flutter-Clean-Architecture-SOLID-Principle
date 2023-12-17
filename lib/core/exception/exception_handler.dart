import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../injection/injector.dart';
import '../resources/data_state.dart';

Future<DataState<T>> tryCatch<T>({
  required Future Function() callBack,
  String errorMsg = "Error Occurred",
  ErrorType errorType = ErrorType.unknown,
}) async {
  try {
    return await callBack();
  } on DioException catch (error) {
    if (error.response?.statusCode == 401) {
      final dState = await appData.refreshToken();
      if (dState is SuccessState) return await callBack();
    }

    bool socketException = error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout;

    if (socketException) return NetworkFailureState();

    debugPrint(error.toString());
    // debugPrint(error.response.toString());

    return FailureState(
      error: error.toString(),
      errorMsg: "Error occurred while requesting",
      errorType: ErrorType.dioException,
    );
  } catch (error) {
    debugPrint(error.toString());
    return FailureState(
      error: error.toString(),
      errorMsg: errorMsg,
      errorType: errorType,
    );
  }
}
