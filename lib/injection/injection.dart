part of 'injector.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<SizeConfig>(SizeConfig());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<OutlineInputBorder>(OutlineInputBorder());
  getIt.registerSingleton<CusSnackBar>(CusSnackBar());

  // Blocs
  getIt.registerSingleton<AuthCubit>(AuthCubit());
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit());
}

final appData = AppData();
final size = getIt<SizeConfig>();
final appRouter = getIt<AppRouter>();
final network = NetworkService();
final dio = getIt<Dio>();
final outlineIB = getIt<OutlineInputBorder>();
final snackBar = getIt<CusSnackBar>();

// <=====Singleton Cubit=====>
final authCubit = getIt<AuthCubit>();

// Repositories
final authRepoImpl = AuthRepoImpl();

// <=====UseCases=====>
// Auth
final loginUC = LoginUseCase(authRepoImpl);
final saveUserDataUC = SaveUserDataUseCase(authRepoImpl);
final saveLogDataUC = SaveLogDataUseCase(authRepoImpl);
final getLogDataUC = GetLogDataUseCase(authRepoImpl);
final getUserDataUC = GetUserDataUseCase(authRepoImpl);
final getRefreshTokenUC = RefreshTokenUseCase(authRepoImpl);
