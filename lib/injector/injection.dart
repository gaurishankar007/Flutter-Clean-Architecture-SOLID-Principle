part of "injector.dart";

final getIt = GetIt.instance;

initializeDependencies() {
  /// Blocs
  _registerBlocs();

  /// Use Cases
  _registerUseCases();

  /// Repository Implementations
  _registerRepositoryImplementations();

  /// Data Sources
  _registerDataSources();

  /// Core
  _registerCores();

  /// External
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
