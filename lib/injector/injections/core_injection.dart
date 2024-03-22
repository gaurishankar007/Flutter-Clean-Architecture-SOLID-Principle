part of '../injector.dart';

_registerCores() {
  getIt.registerLazySingleton<LocalDatabase>(() => LocalDatabaseImplementation());
  getIt.registerLazySingleton<NetworkStatus>(
    () => NetworkStatus(internetConnectionChecker: getIt(), connectivity: getIt()),
  );
  getIt.registerLazySingleton(() => UserService(getUserDataUseCase: getIt()));
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<NetworkService>(() => NetworkServiceImplementation(dio: Dio()));
}
