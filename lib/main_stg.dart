import 'package:flutter/material.dart';

import 'app_configuration.dart';
import 'application.dart';
import 'service_initializer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices(environment: Flavor.staging);

  runApp(const CleanArchitectureSample());
}
