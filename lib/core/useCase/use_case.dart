import '../resources/data_state.dart';

abstract class UseCase<T, P> {
  FutureData<T> call(P parameter);
}

abstract class UseCaseNoParameter<T> {
  FutureData<T> call();
}
