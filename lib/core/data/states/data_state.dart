import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'data_error_type.dart';
part 'failure_state.dart';
part 'loading_state.dart';
part 'success_state.dart';

/// Stores the data received from the api.
/// Also receives error if error is occurs in the path way.
@immutable
sealed class DataState<T> extends Equatable {
  final T? data;
  final String? message;
  final bool hasData;
  final bool hasError;
  final DataErrorType? errorType;
  final int? statusCode;

  const DataState({
    this.data,
    this.message,
    this.hasData = false,
    this.hasError = false,
    this.errorType,
    this.statusCode,
  });

  R when<R>({
    required R Function(T data) success,
    required R Function(String? message, DataErrorType? errorType) failure,
    required R Function() loading,
  }) {
    if (hasData) {
      return success(data as T);
    } else if (hasError) {
      return failure(message, errorType);
    } else {
      return loading();
    }
  }

  @override
  List<Object?> get props => [
        data,
        message,
        hasData,
        hasError,
        errorType,
        statusCode,
      ];
}
