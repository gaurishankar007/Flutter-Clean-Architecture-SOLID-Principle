part of "injector.dart";

/// Singleton Class
Initializer get initializer => Initializer();
ScreenSize get screen => ScreenSize();

/// Bloc
AuthCubit get authCubit => getIt<AuthCubit>();

/// Core
LocalDatabase get localDatabase => getIt<LocalDatabase>();
NetworkStatus get networkStatus => getIt<NetworkStatus>();
UserService get userService => getIt<UserService>();
AppRouter get appRouter => getIt<AppRouter>();
