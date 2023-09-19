part of 'injector.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<SizeConfig>(SizeConfig());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<OutlineInputBorder>(OutlineInputBorder());
  getIt.registerSingleton<CusSnackBar>(CusSnackBar());

  // Blocs
}
