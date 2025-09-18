import '../../utils/type_defs.dart';

abstract class UseCase<T, P extends Object?> {
  FutureData<T> call(P request);
}

abstract class UseCaseNoParameter<T> {
  FutureData<T> call();
}
