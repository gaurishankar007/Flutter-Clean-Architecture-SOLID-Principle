import 'package:flutter/material.dart';

import 'application.dart';
import 'injector/injector_dev.dart';
import 'service_initializer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDevDependencies();
  await initializeServices();

  runApp(const CleanArchitectureSample());
}
