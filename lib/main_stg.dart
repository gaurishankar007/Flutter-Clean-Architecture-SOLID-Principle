import 'package:flutter/material.dart';

import 'app_configuration.dart';
import 'application.dart';
import 'injector/injector.dart';
import 'service_initializer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(environment: Flavor.staging);
  await initializeServices();

  runApp(const CleanArchitectureSample());
}
