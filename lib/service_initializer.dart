import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'core/services/internet/internet_service.dart';
import 'core/services/user_data_service.dart';

Future<void> initializeServices() async {
  await Future.wait<dynamic>([
    GetIt.I<InternetService>().checkAndListenConnectivity(),
    UserDataUtil.I.checkForUserCredential(),
    dotenv.load(fileName: ".env"),
  ]);
}
