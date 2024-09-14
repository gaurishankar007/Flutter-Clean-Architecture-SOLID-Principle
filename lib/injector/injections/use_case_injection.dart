import 'package:get_it/get_it.dart';

import '../../features/auth/domain/use_cases/check_authentication_use_case.dart';
import '../../features/auth/domain/use_cases/get_user_data_use_case.dart';
import '../../features/auth/domain/use_cases/login_use_case.dart';
import '../../features/auth/domain/use_cases/save_user_data_use_case.dart';

final locator = GetIt.instance;

registerUseCases() {
  /// Auth
  locator.registerLazySingleton(
    () => LoginUseCase(authRepository: locator()),
  );
  locator.registerLazySingleton(
    () => SaveUserDataUseCase(authRepository: locator()),
  );
  locator.registerLazySingleton(
    () => GetUserDataUseCase(authRepository: locator()),
  );
  locator.registerLazySingleton(
    () => CheckAuthenticationUseCase(authRepository: locator()),
  );
}
