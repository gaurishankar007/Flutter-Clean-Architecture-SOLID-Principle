// ignore_for_file: constant_identifier_names

part of 'data_state.dart';

const String CUSTOMER_SUPPORT = "Please contact our customer support.";
const String DEFAULT_ERROR = "Unexpected error occurred. $CUSTOMER_SUPPORT";
const String CHECK_INTERNET = "Please check your internet and try again.";

/// A failure data state when error occurs
class FailureState<T> extends DataState<T> {
  const FailureState({
    String? error,
    DataErrorType? errorType,
    super.statusCode,
  }) : super(
          message: error ?? DEFAULT_ERROR,
          hasError: true,
          errorType: errorType ?? DataErrorType.unknown,
        );

  /// A failure data state when type error occurs
  factory FailureState.typeError() => const FailureState(
        error: "Error occurred. Unsupported data type is assigned.",
        errorType: DataErrorType.typeError,
      );

  /// A failure data state when format exception occurs
  factory FailureState.formatException() => const FailureState(
        error: "Error occurred. Operation on unsupported data format.",
        errorType: DataErrorType.formatException,
      );

  /// A failure data state when isar error occurs
  factory FailureState.isarError(String error) =>
      FailureState(error: error, errorType: DataErrorType.isarError);
}

/// A failure data state when error occurs in the server
class BadRequestState<T> extends FailureState<T> {
  const BadRequestState({
    super.error = "Bad request. Please try again",
    super.errorType = DataErrorType.requestError,
    super.statusCode,
  });

  /// A failure data state when the user's token is expired
  factory BadRequestState.tokenExpired() => const BadRequestState(
        error: "Token is expired. Login again.",
        errorType: DataErrorType.tokenError,
      );
}

/// A failure data state when the response of the server is invalid
class BadResponseState<T> extends FailureState<T> {
  const BadResponseState({
    super.error = "Invalid server response.",
    super.errorType = DataErrorType.responseError,
    super.statusCode,
  });
}

/// A failure data state when error occurs in the server
class ServerFailureState<T> extends FailureState<T> {
  const ServerFailureState({
    super.error = "Server error occurred. $CUSTOMER_SUPPORT",
    super.errorType = DataErrorType.serverError,
    super.statusCode,
  });
}

/// A failure data state when there is no internet access
class NoInternetState<T> extends FailureState<T> {
  const NoInternetState({
    super.error = "No internet access.",
    super.errorType = DataErrorType.internetError,
  });
}
