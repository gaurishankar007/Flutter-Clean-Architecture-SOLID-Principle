part of 'data_state.dart';

/// A success data state when there is no any error and data is available
class SuccessState<T> extends DataState<T> {
  const SuccessState({required super.data});
}
