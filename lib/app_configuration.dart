import 'package:get_it/get_it.dart';

import 'core/constants/api_endpoint.dart';


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

class AppConfigProduction extends AppConfiguration {
  const AppConfigProduction()
      : super(
          appTitle: "Clean Architecture App",
          apiBaseUrl: ApiEndpoint.baseProduction,
          flavor: Flavor.production,
        );
}

class AppConfigStaging extends AppConfiguration {
  const AppConfigStaging()
      : super(
          appTitle: "Clean Architecture App Staging",
          apiBaseUrl: ApiEndpoint.baseStaging,
          flavor: Flavor.staging,
        );
}

class AppConfigDevelopment extends AppConfiguration {
  const AppConfigDevelopment()
      : super(
          appTitle: "Clean Architecture App Development",
          apiBaseUrl: ApiEndpoint.baseDevelopment,
          flavor: Flavor.development,
        );
}

/// A util class for accessing [AppConfiguration]
class AppConfigurationUtil {
  AppConfigurationUtil._();

  /// Returns the registered instance of [AppConfiguration] which is always the same.
  static AppConfiguration get I => GetIt.I<AppConfiguration>();
}
