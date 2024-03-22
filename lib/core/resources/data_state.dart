import 'package:equatable/equatable.dart';

import '../errors/error_data.dart';

typedef FutureData<T> = Future<DataState<T>>;
typedef FutureList<T> = Future<DataState<List<T>>>;
typedef FutureBool = Future<DataState<bool>>;

abstract class DataState<T> extends Equatable {
  final T? data;
  final ErrorData? error;

  const DataState({this.data, this.error});

  @override
  List<Object?> get props => [data, error];
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({required T data}) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  const DataFailure({ErrorData error = const ErrorData()}) : super(error: error);
}

class DataNetworkFailure<T> extends DataState<T> {
  const DataNetworkFailure({
    super.error = const ErrorData(
      error: "Network Connection Error",
      message: "Network connection failed",
      type: ErrorType.noNetwork,
    ),
  });
}
