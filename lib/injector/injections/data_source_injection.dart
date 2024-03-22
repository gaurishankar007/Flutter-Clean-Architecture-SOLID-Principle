part of '../injector.dart';

_registerDataSources() {
  /// Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementation(networkService: getIt()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImplementation(localDatabase: getIt()),
  );
}
