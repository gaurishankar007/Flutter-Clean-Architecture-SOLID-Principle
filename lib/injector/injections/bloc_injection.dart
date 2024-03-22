part of '../injector.dart';

_registerBlocs() {
  /// Auth
  getIt.registerLazySingleton(
    () => AuthCubit(
      dependency: AuthCubitDependency(
        signInUseCase: getIt(),
        signUpUseCase: getIt(),
        saveUserDataUseCase: getIt(),
        userService: getIt(),
      ),
    ),
  );
}
