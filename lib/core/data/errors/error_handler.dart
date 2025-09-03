part of 'data_handler.dart';

class ErrorHandler {
  ErrorHandler._();

  /// Catches exceptions and logs the error.
  static Future<void> catchException(Function() callBack) async {
    try {
      await callBack();
    } catch (error, stackTrace) {
      debugError(error, stackTrace);
    }
  }

  /// Handles exceptions and returns appropriate failure states.
  static FutureData<T> handleException<T>(
    FutureData<T> Function() callBack,
  ) async {
    try {
      return await callBack();
    } on DioException catch (exception, stackTrace) {
      debugError("Error Response: ${exception.response?.toString()}");
      debugError(exception, stackTrace);
      return _dioExceptionToFailureState<T>(exception);
    } 
    // on FirebaseAuthException catch (exception, stackTrace) {
    //   debugError(exception, stackTrace);
    //   return _firebaseAuthExceptionToFailureState<T>(exception);
    // } on GoogleSignInException catch (exception, stackTrace) {
    //   debugError(exception, stackTrace);
    //   return _googleSignInExceptionToFailureState<T>(exception);
    // } 
    on TypeError catch (error, stackTrace) {
      debugError(error, stackTrace);
      return FailureState.typeError();
    } on FormatException catch (exception, stackTrace) {
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
    String? errorMessage = ERROR_MESSAGE;
    DioExceptionType errorType = exception.type;
    Response? response = exception.response;
    final statusCode = response?.statusCode ?? 0;

    /// If the server response contains error status codes
    if (errorType == DioExceptionType.badResponse && response != null) {
      if (response.data is Map) errorMessage = response.data?['message'];

      if (statusCode >= 400 && statusCode < 500) {
        return FailureState.badRequest(
          message: errorMessage,
          statusCode: statusCode,
        );
      } else if (statusCode >= 500) {
        return FailureState.serverError(
          message: errorMessage,
          statusCode: statusCode,
        );
      }
    }

    errorMessage = _dioErrorMessages[errorType.name] ?? ERROR_MESSAGE;

    return FailureState(
      message: errorMessage,
      errorType: ErrorType.dioError,
      statusCode: statusCode,
    );
  }

  /// Returns the respective data failure state base on the firebase auth exception.
  // static FailureState<T> _firebaseAuthExceptionToFailureState<T>(
  //   FirebaseAuthException exception,
  // ) {
  //   final firebaseAuthError = exception.code.toLowerCase().trim();
  //   final errorMessage =
  //       _firebaseAuthErrorMessages[firebaseAuthError] ?? ERROR_MESSAGE;

  //   return FailureState(
  //     message: errorMessage,
  //     errorType: ErrorType.firebaseAuthError,
  //   );
  // }

  /// Returns the respective data failure state base on the google sign in exception.
  // static FailureState<T> _googleSignInExceptionToFailureState<T>(
  //   GoogleSignInException exception,
  // ) {
  //   final errorCode = exception.code.name;
  //   final errorMessage = _googleSignInErrorMessages[errorCode] ?? ERROR_MESSAGE;
  //   return FailureState<T>(
  //     message: errorMessage,
  //     errorType: ErrorType.googleSignInError,
  //   );
  // }

  static void debugError(Object? error, [StackTrace? stackTrace]) {
    if (kDebugMode) {
      log(
        "<--------- Caught Exception ---------->",
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static const _dioErrorMessages = {
    "connectionError": "Connection error, host lookup failed.",
    "cancel": "Request was cancelled",
    "receiveTimeout": "Receive timeout in connection. $CHECK_INTERNET",
    "sendTimeout": "Send timeout in connection. $CHECK_INTERNET",
    "connectionTimeout": "Connection timeout. $CHECK_INTERNET",
    "badCertificate": "Bad certificate. $CUSTOMER_SUPPORT",
  };

  // static const _firebaseAuthErrorMessages = {
  //   'invalid-credential': 'The given user was not found on the server!',
  //   'user-not-found': 'The given user was not found on the server!',
  //   'wrong-password':
  //       'The password is invalid or the user does not have a password.',
  //   'weak-password':
  //       'Please choose a stronger password consisting of more characters!',
  //   'invalid-email':
  //       'Invalid email. Please double check your email and try again!',
  //   'operation-not-allowed':
  //       'You cannot register using this method at this moment!',
  //   'email-already-in-use':
  //       'Email already in use.Please choose another email to register with!',
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

  // static const _googleSignInErrorMessages = {
  //   'unknownError':
  //       'An unknown error occurred during Google Sign-In. Please try again.',
  //   'canceled':
  //       'The sign-in process was canceled. Please try again if you want to sign in.',
  //   'interrupted': 'The sign-in process was interrupted. Please try again.',
  //   'clientConfigurationError':
  //       'Google Sign-In is not configured correctly on this app. Please contact support.',
  //   'providerConfigurationError':
  //       'There is a problem with the Google Sign-In provider configuration. Please contact support.',
  //   'uiUnavailable':
  //       'The sign-in UI could not be displayed. This might be a temporary issue, please try again.',
  //   'userMismatch':
  //       'The user trying to sign in is different from the one already signed in. Please sign out first.',
  // };
}
