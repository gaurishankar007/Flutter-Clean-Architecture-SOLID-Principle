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
    required ErrorType errorType,
  }) : super(error: error, errorMsg: errorMsg, errorType: errorType);

  @override
  List<Object?> get props => [errorMsg, errorType];
}

class NetworkFailureState<T> extends DataState<T> {
  const NetworkFailureState({
    String error = "Network Connection Error",
    String errorMsg = "Network connection failed",
    ErrorType errorType = ErrorType.noNetwork,
  }) : super(error: error, errorMsg: errorMsg, errorType: errorType);

  @override
  List<Object?> get props => [];
}

enum ErrorType {
  unknown,
  dioException,
  isarException,
  sharedPreferenceException,
  noNetwork,
  socketTimeOut,
  tokenExpired,
  invalidUserCredential,
  server,
}
