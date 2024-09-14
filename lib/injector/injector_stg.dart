import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../app_config.dart';
import '../core/services/dio/dio_client.dart';
import 'injector.dart';

final locator = GetIt.instance;

void initializeSTGDependencies() {
  initializeDependencies();

  locator.registerLazySingleton(() => const AppConfig.staging());

  locator.registerLazySingleton(
    () => DioClient(
      appConfig: locator(),
      interceptors: [
        DioInterceptor(
          dio: Dio(),
          userDataService: locator(),
        ),
      ],
    ),
  );
}
