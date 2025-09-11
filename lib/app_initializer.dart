import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/data_handling/data_handler.dart';
import 'core/services/internet/internet_service.dart';
import 'core/services/session/session_service.dart';
import 'injector/injector.dart';

class AppInitializer {
  const AppInitializer._();

  static Future<void> initializeApp({required String environment}) async {
    await ErrorHandler.catchException(() async {
      await dotenv.load(fileName: ".env");
      await configureDependencies(environment: environment);
      await SessionUtil.I.checkForUserCredential();
      InternetUtil.I.subscribeConnectivity();
    });
  }
}
