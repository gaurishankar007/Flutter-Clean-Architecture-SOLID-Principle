import 'package:equatable/equatable.dart';

abstract class DataState<T> extends Equatable {
  final T? data;
  final String? error;
  final String? errorMsg;
  final ErrorType? errorType;

  const DataState({this.data, this.error, this.errorMsg, this.errorType});
}

class SuccessState<T> extends DataState<T> {
  const SuccessState({required T data}) : super(data: data);

  @override
  List<Object?> get props => [data];
}

class FailureState<T> extends DataState<T> {
  const FailureState({
    required String error,
    required String errorMsg,
    ErrorType errorType = ErrorType.unknown,
  }) : super(error: error, errorMsg: errorMsg, errorType: errorType);

  @override
  List<Object?> get props => [errorMsg, errorType, errorType];
}

class NetworkFailureState<T> extends DataState<T> {
  const NetworkFailureState({
    String error = "Network Connection Error",
    String errorMsg = "Network connection failed",
    ErrorType errorType = ErrorType.noNetwork,
  }) : super(error: error, errorMsg: errorMsg, errorType: errorType);

  @override
  List<Object?> get props => [error, errorMsg, errorType];
}

enum ErrorType {
  unknown,
  dioException,
  isarException,
  sharedPreferenceException,
  noNetwork,
  socketTimeOut,
  tokenExpired,
  tokenInvalid,
  invalidUserCredential,
  server,
  notFound,
}
