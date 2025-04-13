// ignore_for_file: constant_identifier_names

part of 'data_state.dart';

const String CUSTOMER_SUPPORT = "Please contact our customer support.";
const String ERROR_MESSAGE = "Unexpected error occurred. $CUSTOMER_SUPPORT";
const String CHECK_INTERNET = "Please check your internet and try again.";

enum ErrorType {
  unknown,
  typeError,
  formatError,
  isarError,
  firebaseError,
  dioError,
  internetError,
  requestError,
  responseError,
  serverError,
  tokenError,
}

/// A failure data state when error occurs
class FailureState<T> extends DataState<T> {
  const FailureState({String? message, ErrorType? errorType, super.statusCode})
      : super(
          message: message ?? ERROR_MESSAGE,
          errorType: errorType ?? ErrorType.unknown,
          hasError: true,
        );

  /// A failure data state when type error occurs
  factory FailureState.typeError() => const FailureState(
        message: "Error occurred. Unsupported data type is assigned.",
        errorType: ErrorType.typeError,
      );

  /// A failure data state when format exception occurs
  factory FailureState.formatError() => const FailureState(
        message: "Error occurred. Operation on unsupported data format.",
        errorType: ErrorType.formatError,
      );

  /// A failure data state when isar error occurs
  factory FailureState.isarError(String errorMessage) =>
      FailureState(message: errorMessage, errorType: ErrorType.isarError);

  /// A failure data state when firebase exception occurs
  factory FailureState.firebaseError(String errorMessage) =>
      FailureState(message: errorMessage, errorType: ErrorType.firebaseError);

  /// A failure data state when dio exception occurs
  factory FailureState.dioError(String errorMessage, {int? statusCode}) =>
      FailureState(
        message: errorMessage,
        errorType: ErrorType.dioError,
        statusCode: statusCode,
      );
}

/// A failure data state when error occurs in the server
class BadRequestState<T> extends FailureState<T> {
  const BadRequestState({
    super.message = "Bad request. Please try again",
    super.errorType = ErrorType.requestError,
    super.statusCode,
  });

  /// A failure data state when the user's token is expired
  factory BadRequestState.tokenExpired() => const BadRequestState(
        message: "Token is expired. Login again.",
        errorType: ErrorType.tokenError,
      );
}

/// A failure data state when the response of the server is invalid
class BadResponseState<T> extends FailureState<T> {
  const BadResponseState({
    super.message = "Invalid server response.",
    super.errorType = ErrorType.responseError,
    super.statusCode,
  });
}

/// A failure data state when error occurs in the server
class ServerErrorState<T> extends FailureState<T> {
  const ServerErrorState({
    super.message = "Server error occurred. $CUSTOMER_SUPPORT",
    super.errorType = ErrorType.serverError,
    super.statusCode,
  });
}

/// A failure data state when there is no internet access
class NoInternetState<T> extends FailureState<T> {
  const NoInternetState({
    super.message = "No internet access.",
    super.errorType = ErrorType.internetError,
  });
}
