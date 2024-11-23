import 'package:alice/alice.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:get_it/get_it.dart';

import '../app_config.dart';
import '../core/services/dio/dio_client.dart';
import '../core/services/navigation/navigation_service.dart';
import 'injector.dart';

final locator = GetIt.instance;

void initializeDevDependencies() {
  initializeDependencies();

  locator.registerLazySingleton<AppConfig>(() => const AppConfigDevelopment());

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
        AwesomeDioInterceptor(
          logResponseHeaders: false,
          logRequestTimeout: false,
        ),
      ],
    ),
  );
}
