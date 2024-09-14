import 'package:get_it/get_it.dart';

import 'core/constants/api_endpoint.dart';

enum Flavor {
  production,
  staging,
  development,
}

/// App configuration for different app flavors.
class AppConfig {
  final String appTitle;
  final String apiBaseUrl;
  final Flavor flavor;

  const AppConfig({
    required this.appTitle,
    required this.apiBaseUrl,
    required this.flavor,
  });

  const AppConfig.production()
      : appTitle = "CleanArchitecture App",
        apiBaseUrl = ApiEndpoint.baseProduction,
        flavor = Flavor.production;

  const AppConfig.staging()
      : appTitle = "CleanArchitecture App Staging",
        apiBaseUrl = ApiEndpoint.baseStaging,
        flavor = Flavor.staging;

  const AppConfig.development()
      : appTitle = "CleanArchitecture App Development",
        apiBaseUrl = ApiEndpoint.baseDevelopment,
        flavor = Flavor.development;
}

/// A util class for accessing [AppConfig]
class AppConfigUtil {
  AppConfigUtil._();

  /// Returns the registered instance of [AppConfig] which is always the same.
  static AppConfig get I => GetIt.I<AppConfig>();
}
