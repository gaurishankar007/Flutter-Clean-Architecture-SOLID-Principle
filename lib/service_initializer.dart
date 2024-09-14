import 'package:get_it/get_it.dart';

import 'core/services/internet_service.dart';
import 'core/services/user_data_service.dart';

Future<void> initializeServices() async {
  await Future.wait<dynamic>([
    GetIt.I<InternetService>().checkAndListenConnectivity(),
    UserDataUtil.I.checkForUserCredential(),
  ]);
}
