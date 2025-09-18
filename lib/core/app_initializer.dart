import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'data_handling/data_handler.dart';
import 'services/internet/internet_service.dart';
import 'services/session/session_service.dart';
import '../config/injector/injector.dart';

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
