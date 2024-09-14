import 'package:get_it/get_it.dart';

import '../../features/auth/domain/entities/login_use_cases.dart';
import '../../features/auth/presentation/cubits/login/login_cubit.dart';
import '../../features/dashboard/domain/entities/dashboard_use_cases.dart';
import '../../features/dashboard/presentation/cubits/dashboard/dashboard_cubit.dart';

final locator = GetIt.instance;

registerBlocs() {
  /// Auth
  locator.registerFactory(
    () => LoginCubit(
      useCases: LoginUseCases(
        login: locator(),
        saveUserData: locator(),
      ),
    ),
  );

  /// Dashboard
  locator.registerFactory(
    () => DashboardCubit(
      useCases: DashboardUseCases(
        checkAuthentication: locator(),
      ),
    ),
  );
}
