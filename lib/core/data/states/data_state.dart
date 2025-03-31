import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'data_state_error.dart';
part 'failure_state.dart';
part 'loading_state.dart';
part 'success_state.dart';

/// Stores the data received from the api.
/// Also receives error if error is occurs in the path way.
@immutable
sealed class DataState<T> extends Equatable {
  final T? data;
  final String? message;
  final DataStateError? error;
  final int? statusCode;
  final bool hasData;
  final bool hasError;

  const DataState({
    this.data,
    this.message,
    this.error,
    this.statusCode,
    this.hasData = false,
    this.hasError = false,
  });

  R when<R>({
    required R Function(T data) success,
    required R Function(String? message, DataStateError? error) failure,
    required R Function() loading,
  }) {
    if (hasData) {
      return success(data as T);
    } else if (hasError) {
      return failure(message, error);
    } else {
      return loading();
    }
  }

  @override
  List<Object?> get props => [
        data,
        message,
        error,
        statusCode,
        hasData,
        hasError,
      ];
}
