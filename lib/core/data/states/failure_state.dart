// ignore_for_file: constant_identifier_names

part of 'data_state.dart';

const String CUSTOMER_SUPPORT = "Please contact our customer support.";
const String DEFAULT_ERROR = "Unexpected error occurred. $CUSTOMER_SUPPORT";
const String CHECK_INTERNET = "Please check your internet and try again.";

/// A failure data state when error occurs
class FailureState<T> extends DataState<T> {
  const FailureState({
    String? message,
    DataStateError? error,
    super.statusCode,
  }) : super(
          message: message ?? DEFAULT_ERROR,
          error: error ?? DataStateError.unknown,
          hasError: true,
        );

  /// A failure data state when type error occurs
  factory FailureState.typeError() => const FailureState(
        message: "Error occurred. Unsupported data type is assigned.",
        error: DataStateError.typeError,
      );

  /// A failure data state when format exception occurs
  factory FailureState.formatException() => const FailureState(
        message: "Error occurred. Operation on unsupported data format.",
        error: DataStateError.formatException,
      );

  /// A failure data state when isar error occurs
  factory FailureState.isarError(String error) =>
      FailureState(message: error, error: DataStateError.isarError);
}

/// A failure data state when error occurs in the server
class BadRequestState<T> extends FailureState<T> {
  const BadRequestState({
    super.message = "Bad request. Please try again",
    super.error = DataStateError.requestError,
    super.statusCode,
  });

  /// A failure data state when the user's token is expired
  factory BadRequestState.tokenExpired() => const BadRequestState(
        message: "Token is expired. Login again.",
        error: DataStateError.tokenError,
      );
}

/// A failure data state when the response of the server is invalid
class BadResponseState<T> extends FailureState<T> {
  const BadResponseState({
    super.message = "Invalid server response.",
    super.error = DataStateError.responseError,
    super.statusCode,
  });
}

/// A failure data state when error occurs in the server
class ServerFailureState<T> extends FailureState<T> {
  const ServerFailureState({
    super.message = "Server error occurred. $CUSTOMER_SUPPORT",
    super.error = DataStateError.serverError,
    super.statusCode,
  });
}

/// A failure data state when there is no internet access
class NoInternetState<T> extends FailureState<T> {
  const NoInternetState({
    super.message = "No internet access.",
    super.error = DataStateError.internetError,
  });
}
