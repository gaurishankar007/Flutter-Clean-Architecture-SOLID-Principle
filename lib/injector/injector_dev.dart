import 'package:alice/alice.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../app_config.dart';
import '../core/services/dio/dio_client.dart';
import '../core/services/navigation/navigation_service.dart';
import 'injector.dart';

final locator = GetIt.instance;

void initializeDevDependencies() {
  initializeDependencies();

  locator.registerLazySingleton(() => const AppConfig.development());

  locator.registerLazySingleton(
    () => DioClient(
      appConfig: locator(),
      interceptors: [
        DioInterceptor(
          dio: Dio(),
          userDataService: locator(),
        ),
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
