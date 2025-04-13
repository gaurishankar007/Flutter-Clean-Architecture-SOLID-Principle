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
      debugError(exception, stackTrace);
      return _dioExceptionToFailureState<T>(exception);
    } on ServerResponseError {
      if (kDebugMode) debugError("Invalid response from the server.");
      return BadResponseState<T>();
    }
    // on FirebaseAuthException catch (exception, stackTrace) {
    //   debugError(exception, stackTrace);
    //   return _firebaseAuthExceptionToFailureState(exception);
    // }
    // on IsarError catch (error, stackTrace) {
    //   debugError(error, stackTrace);
    //   return FailureState.isarError(error.toString());
    // }
    on TypeError catch (error, stackTrace) {
      debugError(error, stackTrace);
      return FailureState.typeError();
    } on FormatException catch (exception, stackTrace) {
      debugError(exception, stackTrace);
      return FailureState.formatError();
    } on PlatformException catch (exception, stackTrace) {
      debugError(exception, stackTrace);
      return FailureState.formatError();
    } catch (error, stackTrace) {
      debugError(error, stackTrace);
      return FailureState<T>(message: error.toString());
    }
  }

  /// Returns the respective data failure state base on the dio exception.
  static FailureState<T> _dioExceptionToFailureState<T>(
    DioException exception,
  ) {
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
        return ServerErrorState(message: errorMessage, statusCode: statusCode);
      }
    }

    /// For other Dio-specific errors (timeouts, cancellation, etc.)
    if (exception.error is FirebaseError) {
      errorMessage = exception.message ?? ERROR_MESSAGE;
    } else {
      errorMessage = _dioErrorMessages[errorType] ?? ERROR_MESSAGE;
    }

    return FailureState.dioError(errorMessage, statusCode: statusCode);
  }

  /// Returns the respective data failure state base on the firebase auth exception.
  // static FailureState<T> _firebaseAuthExceptionToFailureState<T>(
  //   FirebaseAuthException exception,
  // ) {
  //   final firebaseAuthError = exception.code.toLowerCase().trim();
  //   final errorMessage =
  //       _firebaseAuthErrorMessages[firebaseAuthError] ?? ERROR_MESSAGE;

  //   return FailureState.firebaseError(errorMessage);
  // }

  static debugError(Object? error, [StackTrace? stackTrace]) {
    if (kDebugMode) {
      log(
        "<--------- Caught Exception ---------->",
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static const Map<DioExceptionType, String> _dioErrorMessages = {
    DioExceptionType.connectionError: "Connection error, host lookup failed.",
    DioExceptionType.cancel: "Request was cancelled",
    DioExceptionType.receiveTimeout:
        "Receive timeout in connection. $CHECK_INTERNET",
    DioExceptionType.sendTimeout: "Send timeout in connection. $CHECK_INTERNET",
    DioExceptionType.connectionTimeout: "Connection timeout. $CHECK_INTERNET",
    DioExceptionType.badCertificate: "Bad certificate. $CUSTOMER_SUPPORT",
  };

  // static const Map<String, String> _firebaseAuthErrorMessages = {
  //   'invalid-credential': 'The given user was not found on the server!',
  //   'user-not-found': 'The given user was not found on the server!',
  //   'wrong-password':
  //       'The password is invalid or the user does not have a password.',
  //   'weak-password':
  //       'Please choose a stronger password consisting of more characters!',
  //   'invalid-email': 'Please double check your email and try again!',
  //   'operation-not-allowed':
  //       'You cannot register using this method at this moment!',
  //   'email-already-in-use': 'Please choose another email to register with!',
  //   'requires-recent-login':
  //       'You need to log out and log back in again in order to perform this operation',
  //   'no-current-user': 'No current user with this information was found',
  //   'user-disabled': 'This user account has been disabled.',
  //   'too-many-requests': 'Too many requests. Try again later.',
  //   'account-exists-with-different-credential':
  //       'An account already exists with a different credential.',
  //   'invalid-verification-code': 'The verification code is invalid or expired.',
  //   'invalid-verification-id': 'The verification ID is invalid.',
  //   'unknown': 'Unknown authentication error',
  // };
}
