part of '../injector.dart';

_registerRepositoryImplementations() {
  /// Auth
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplementation(
      networkStatus: getIt(),
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );
}
