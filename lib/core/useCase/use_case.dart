import 'package:boilerplate/core/resources/data_state.dart';

abstract class UC<T> {
  Future<DataState<T>> call();
}
