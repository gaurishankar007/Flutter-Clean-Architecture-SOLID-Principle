import 'package:flutter/material.dart';

import 'app_config.dart';
import 'app_initializer.dart';
import 'application.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initializeApp(environment: Flavor.development);

  runApp(const CleanArchitectureSample());
}
