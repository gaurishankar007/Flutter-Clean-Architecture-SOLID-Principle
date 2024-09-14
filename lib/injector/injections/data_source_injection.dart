import 'package:get_it/get_it.dart';

import '../../features/auth/data/data_sources/auth_local_data_source.dart';
import '../../features/auth/data/data_sources/auth_remote_data_source.dart';

final locator = GetIt.instance;

registerDataSources() {
  /// Auth
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementation(dioClient: locator()),
  );

  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImplementation(localDatabase: locator()),
  );
}
