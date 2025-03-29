part of 'data_handler.dart';

class ErrorHandler {
  ErrorHandler._();

  /// Exception and error handler for Dio, Type, Format, and other
  static FutureData<T> catchException<T>(
    FutureData<T> Function() callBack,
  ) async {
    try {
      return await callBack();
    } on DioException catch (error) {
      return dioErrorToFailureState<T>(error);
    } on ServerResponseError {
      if (kDebugMode) log("Invalid response from the server.");
      return BadResponseState<T>();
    } on TypeError catch (error) {
      if (kDebugMode) log(error.toString());
      return FailureState.typeError();
    } on FormatException catch (error) {
      if (kDebugMode) log(error.toString());
      return FailureState.formatException();
    } catch (error) {
      if (kDebugMode) log(error.toString());
      return FailureState<T>();
    }
  }

  /// Returns the respective data failure state base on the dio exception type.
  static FailureState<T> dioErrorToFailureState<T>(DioException exception) {
    try {
      String error = DEFAULT_ERROR;
      DioExceptionType errorType = exception.type;
      int statusCode = exception.response?.statusCode ?? 0;
      bool isBadResponse = errorType == DioExceptionType.badResponse;
      bool hasResponse = exception.response != null;

      /// If the server response contains error status codes
      if (isBadResponse && hasResponse) {
        if (statusCode >= 400 && statusCode < 500) {
          final responseData = exception.response!.data;
          return BadRequestState(
            error: responseData['msg'] as String?,
            statusCode: statusCode,
          );
        } else if (statusCode >= 500) {
          return ServerFailureState(statusCode: statusCode);
        }
      }

      /// Other errors
      if (errorType == DioExceptionType.connectionError) {
        error = "Connection error, host lookup failed.";
      } else if (errorType == DioExceptionType.cancel) {
        error = "Request was cancelled";
      } else if (errorType == DioExceptionType.receiveTimeout) {
        error = "Receive timeout in connection. $CHECK_INTERNET";
      } else if (errorType == DioExceptionType.sendTimeout) {
        error = "Send timeout in connection. $CHECK_INTERNET";
      } else if (errorType == DioExceptionType.connectionTimeout) {
        error = "Connection timeout. $CHECK_INTERNET";
      } else if (errorType == DioExceptionType.badCertificate) {
        error = "Bad certificate. $CUSTOMER_SUPPORT";
      }

      return FailureState(
        error: error,
        errorType: DataErrorType.dioException,
        statusCode: statusCode,
      );
    } catch (error) {
      return FailureState(
        error: error.toString(),
        errorType: DataErrorType.unknown,
      );
    }
  }
}
