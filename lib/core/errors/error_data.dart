import 'package:equatable/equatable.dart';

class ErrorData extends Equatable {
  final String error;
  final String message;
  final ErrorType type;

  const ErrorData({
    this.error = "Operation failed",
    this.message = "Error occurred",
    this.type = ErrorType.unknown,
  });

  @override
  List<Object?> get props => [
        error,
        message,
        type,
      ];
}

enum ErrorType {
  unknown,
  typeError,
  formatException,
  dioException,
  isarException,
  noNetwork,
  socketTimeOut,
  invalidUserCredential,
  tokenExpired,
  badRequest,
  server,
}
