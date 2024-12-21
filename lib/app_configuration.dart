import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

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

@LazySingleton(as: AppConfiguration, env: [Flavor.production])
class ProdAppConfiguration extends AppConfiguration {
  const ProdAppConfiguration()
      : super(
          appTitle: "Clean Architecture App",
          apiBaseUrl: ApiEndpoint.baseProduction,
          flavor: Flavor.production,
        );
}

@LazySingleton(as: AppConfiguration, env: [Flavor.staging])
class StgAppConfiguration extends AppConfiguration {
  const StgAppConfiguration()
      : super(
          appTitle: "Clean Architecture App Staging",
          apiBaseUrl: ApiEndpoint.baseStaging,
          flavor: Flavor.staging,
        );
}

@LazySingleton(as: AppConfiguration, env: [Flavor.development])
class DevAppConfiguration extends AppConfiguration {
  const DevAppConfiguration()
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
