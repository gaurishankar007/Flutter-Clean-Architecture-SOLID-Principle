import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'core/services/internet/internet_service.dart';
import 'core/services/session/session_manager.dart';
import 'injector/injector.dart';

class AppInitializer {
  static Future<void> initializeApp({required String environment}) async {
    await dotenv.load(fileName: ".env");
    configureDependencies(environment: environment);

    GetIt.I<InternetService>().subscribeConnectivity();
    await SessionManagerUtil.I.checkForUserCredential();
  }
}
