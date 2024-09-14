import 'package:flutter/material.dart';

import 'application.dart';
import 'injector/injector_prod.dart';
import 'service_initializer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeProdDependencies();
  await initializeServices();

  runApp(const CleanArchitectureSample());
}
