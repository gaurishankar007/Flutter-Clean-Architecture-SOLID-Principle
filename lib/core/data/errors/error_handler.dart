part of 'data_handler.dart';

class ErrorHandler {
  ErrorHandler._();

  /// Exception and error handler for Dio, Type, Format, and other
  static FutureData<T> catchException<T>(
    FutureData<T> Function() callBack,
  ) async {
    try {
      return await callBack();
    } on DioException catch (exception, stackTrace) {
      _debugError(exception, stackTrace);
      return dioErrorToFailureState<T>(exception);
    } on ServerResponseError {
      if (kDebugMode) log("Invalid response from the server.");
      return BadResponseState<T>();
    } on TypeError catch (error, stackTrace) {
      _debugError(error, stackTrace);
      return FailureState.typeError();
    } on FormatException catch (exception, stackTrace) {
      _debugError(exception, stackTrace);
      return FailureState.formatException();
    } catch (error, stackTrace) {
      _debugError(error, stackTrace);
      return FailureState<T>();
    }
  }

  /// Returns the respective data failure state base on the dio exception type.
  static FailureState<T> dioErrorToFailureState<T>(DioException exception) {
    try {
      String errorMessage = ERROR_MESSAGE;
      DioExceptionType errorType = exception.type;
      Response? response = exception.response;
      final statusCode = response?.statusCode ?? 0;

      /// If the server response contains error status codes
      if (errorType == DioExceptionType.badResponse && response != null) {
        if (response.data is Map) errorMessage = response.data?['message'];

        if (statusCode >= 400 && statusCode < 500) {
          return BadRequestState(message: errorMessage, statusCode: statusCode);
        } else if (statusCode >= 500) {
          return ServerErrorState(
            message: errorMessage,
            statusCode: statusCode,
          );
        }
      }

      /// Other errors
      if (errorType == DioExceptionType.connectionError) {
        errorMessage = "Connection error, host lookup failed.";
      } else if (errorType == DioExceptionType.cancel) {
        errorMessage = "Request was cancelled";
      } else if (errorType == DioExceptionType.receiveTimeout) {
        errorMessage = "Receive timeout in connection. $CHECK_INTERNET";
      } else if (errorType == DioExceptionType.sendTimeout) {
        errorMessage = "Send timeout in connection. $CHECK_INTERNET";
      } else if (errorType == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timeout. $CHECK_INTERNET";
      } else if (errorType == DioExceptionType.badCertificate) {
        errorMessage = "Bad certificate. $CUSTOMER_SUPPORT";
      }

      return FailureState(
        message: errorMessage,
        errorType: ErrorType.dioException,
        statusCode: statusCode,
      );
    } catch (error) {
      return FailureState(
        message: error.toString(),
        errorType: ErrorType.unknown,
      );
    }
  }

  static _debugError(Object? error, StackTrace? stackTrace) {
    if (kDebugMode) {
      log(
        "<--------- Caught Exception ---------->",
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
