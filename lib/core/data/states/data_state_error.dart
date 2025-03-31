part of 'data_state.dart';

/// Different categories of data state failure
enum DataStateError {
  unknown,
  typeError,
  formatException,
  isarError,
  dioException,
  internetError,
  requestError,
  responseError,
  tokenError,
  serverError,
}
