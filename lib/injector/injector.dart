import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

@InjectableInit(initializerName: "initialize")
void configureDependencies({String? environment}) =>
    GetIt.I.initialize(environment: environment);
