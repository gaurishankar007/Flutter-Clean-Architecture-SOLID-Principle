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

  const DataState({
    this.data,
    this.message,
    this.hasData = false,
    this.hasError = false,
    this.errorType,
  });

  @override
  List<Object?> get props => [
        data,
        message,
        hasData,
        hasError,
        errorType,
      ];
}
