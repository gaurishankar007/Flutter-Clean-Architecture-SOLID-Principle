import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repository_implementation.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';

final locator = GetIt.instance;

registerRepositoryImplementations() {
  /// Auth
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplementation(
      internet: locator(),
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
}
