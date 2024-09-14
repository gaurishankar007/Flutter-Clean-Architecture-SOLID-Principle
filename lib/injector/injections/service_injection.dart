import 'package:get_it/get_it.dart';

import '../../core/services/dio/dio_client.dart';
import '../../core/services/image_picker/image_picker_service.dart';
import '../../core/services/internet_service.dart';
import '../../core/services/local_database_service.dart';
import '../../core/services/message/toast_message_service.dart';
import '../../core/services/navigation/navigation_service.dart';
import '../../core/services/user_data_service.dart';

final locator = GetIt.instance;

registerServices() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ImagePickerService());
  locator.registerLazySingleton(() => ToastMessageService());
  locator.registerLazySingleton(() => InternetService());
  locator.registerLazySingleton(() => LocalDatabaseService());
  locator.registerLazySingleton(
    () => UserDataService(
      localDatabase: locator(),
      navigationService: locator(),
    ),
  );
  locator.registerLazySingleton(() => DioMultiPartClient());
}
