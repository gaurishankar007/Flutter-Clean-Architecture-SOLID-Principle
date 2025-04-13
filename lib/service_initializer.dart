import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'core/services/internet/internet_service.dart';
import 'core/services/app_session_service.dart';
import 'injector/injector.dart';

Future<void> initializeServices({required String environment}) async {
  await dotenv.load(fileName: ".env");
  configureDependencies(environment: environment);

  await Future.wait<dynamic>([
    GetIt.I<InternetService>().subscribeConnectivity(),
    AppSessionUtil.I.checkForUserCredential(),
  ]);
}
