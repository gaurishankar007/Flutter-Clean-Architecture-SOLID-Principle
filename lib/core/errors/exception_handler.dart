import 'package:flutter/material.dart' show debugPrint;

import '../resources/data_state.dart';
import '../services/local_database.dart';
import '../services/network_service.dart';
import 'error_data.dart';

/// Handles exceptions and returns [DataState]
FutureData<T> exceptionHandler<T>(Future Function() callBack, {ErrorData? errorData}) async {
  try {
    return await callBack();
  } on DioFailure catch (error) {
    debugPrint(error.toString());
    // debugPrint(error.response.toString());

    if (dioSocketExceptions.contains(error.type)) return DataNetworkFailure<T>();

    final errorData = ErrorData(
      error: error.toString(),
      message: "Server request failed",
      type: ErrorType.dioException,
    );
    return DataFailure<T>(error: errorData);
  } on IsarException catch (error) {
    debugPrint(error.toString());
    final errorData = ErrorData(
      error: error.toString(),
      message: "Local database error",
      type: ErrorType.isarException,
    );
    return DataFailure<T>(error: errorData);
  } on TypeError catch (error) {
    debugPrint(error.toString());
    final errorData = ErrorData(
      error: error.toString(),
      message: "Unsupported data type is assigned",
      type: ErrorType.typeError,
    );
    return DataFailure<T>(error: errorData);
  } on FormatException catch (error) {
    debugPrint(error.toString());
    final errorData = ErrorData(
      error: error.toString(),
      message: "Operation on unsupported data format",
      type: ErrorType.formatException,
    );
    return DataFailure<T>(error: errorData);
  } catch (error) {
    debugPrint(error.toString());
    return DataFailure<T>(error: errorData ?? ErrorData(error: error.toString()));
  }
}
