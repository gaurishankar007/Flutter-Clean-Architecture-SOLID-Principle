import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

class Flavor {
  Flavor._();

  static const production = 'production';
  static const staging = 'staging';
  static const development = 'development';
}

/// App configuration for different app flavors.
class AppConfiguration {
  final String appTitle;
  final String apiBaseUrl;
  final String flavor;

  const AppConfiguration({
    required this.appTitle,
    required this.apiBaseUrl,
    required this.flavor,
  });
}

@LazySingleton(as: AppConfiguration, env: [Flavor.production])
class ProdAppConfiguration extends AppConfiguration {
  ProdAppConfiguration()
      : super(
          appTitle: "Clean Architecture App",
          apiBaseUrl: dotenv.maybeGet("BASE_PRODUCTION") ??
              "https://development.com.np/",
          flavor: Flavor.production,
        );
}

@LazySingleton(as: AppConfiguration, env: [Flavor.staging])
class StgAppConfiguration extends AppConfiguration {
  StgAppConfiguration()
      : super(
          appTitle: "Clean Architecture App Staging",
          apiBaseUrl:
              dotenv.maybeGet("BASE_STAGING") ?? "https://development.com.np/",
          flavor: Flavor.staging,
        );
}

@LazySingleton(as: AppConfiguration, env: [Flavor.development])
class DevAppConfiguration extends AppConfiguration {
  DevAppConfiguration()
      : super(
          appTitle: "Clean Architecture App Development",
          apiBaseUrl: dotenv.maybeGet("BASE_DEVELOPMENT") ??
              "https://development.com.np/",
          flavor: Flavor.development,
        );
}

/// A util class for accessing [AppConfiguration]
class AppConfigurationUtil {
  AppConfigurationUtil._();

  /// Returns the registered instance of [AppConfiguration] which is always the same.
  static AppConfiguration get I => GetIt.I<AppConfiguration>();
}
