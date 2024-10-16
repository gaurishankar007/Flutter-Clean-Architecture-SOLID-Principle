import 'package:get_it/get_it.dart';

import '../app_config.dart';
import '../core/services/dio/dio_client.dart';
import 'injector.dart';

final locator = GetIt.instance;

void initializeProdDependencies() {
  initializeDependencies();

  locator.registerLazySingleton(() => const AppConfig.production());

  locator.registerLazySingleton(
    () => DioClient(
      appConfig: locator(),
      interceptors: [
        DioInterceptor(userDataService: locator()),
      ],
    ),
  );
}
