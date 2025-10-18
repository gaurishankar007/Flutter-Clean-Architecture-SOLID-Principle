import 'package:flutter/material.dart';

import 'config/app_config.dart';
import 'core/app_initializer.dart';
import 'shared_ui/application.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initializeApp(environment: Flavor.production);

  runApp(const CleanArchitectureSample());
}
