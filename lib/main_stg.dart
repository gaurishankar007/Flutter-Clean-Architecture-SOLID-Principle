import 'package:flutter/material.dart';

import 'application.dart';
import 'injector/injector_stg.dart';
import 'service_initializer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeSTGDependencies();
  await initializeServices();

  runApp(const CleanArchitectureSample());
}
