import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/core/constants/route_path.dart';
import 'package:boilerplate/core/navigation/navigation.dart';
import 'package:boilerplate/injection/injector.dart';
import '../resources/data_state.dart';

Future<DataState<T>> checkConnection<T>(Future<DataState<T>> future) async {
  if (networkService.isConnected) return future;

  return NetworkFailureState();
}

Future<DataState<T>> tryCatch<T>({
  required Future Function() callBack,
  String? errorMsg,
  ErrorType? errorType,
}) async {
  try {
    return await callBack();
  } on DioException catch (error) {
    if (error.response?.statusCode == 401) {
      navWithPath(kLoginP);
      snackBar.snackThis(
        message: "Your token has been expired, login again.",
        color: kR600,
      );
    }

    bool socketException = error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout;

    if (socketException) {
      return NetworkFailureState();
    }

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
      errorMsg: errorMsg ?? "Error Occurred",
      errorType: errorType ?? ErrorType.unknown,
    );
  }
}
