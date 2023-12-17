import '../resources/data_state.dart';

abstract class UC<T> {
  Future<DataState<T>> call();
}
