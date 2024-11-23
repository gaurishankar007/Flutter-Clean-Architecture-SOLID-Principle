import 'package:alice/alice.dart';
import 'package:get_it/get_it.dart';

import '../app_config.dart';
import '../core/services/dio/dio_client.dart';
import '../core/services/navigation/navigation_service.dart';
import 'injector.dart';

final locator = GetIt.instance;

void initializeSTGDependencies() {
  initializeDependencies();

  locator.registerLazySingleton<AppConfig>(() => const AppConfigStaging());

  locator.registerLazySingleton<DioClient>(
    () => DioClientImplementation(
      appConfig: locator(),
      interceptors: [
        DioInterceptor(userDataService: locator()),
        Alice(
          navigatorKey: locator<NavigationService>().navigatorKey,
          showNotification: true,
          showInspectorOnShake: true,
        ).getDioInterceptor(),
      ],
    ),
  );
}
