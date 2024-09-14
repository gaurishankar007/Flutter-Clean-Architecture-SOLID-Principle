import 'package:flutter/material.dart';

import 'app_config.dart';
import 'config/theme/theme.dart';
import 'core/services/navigation/navigation_service.dart';
import 'core/utils/screen_util/screen_util.dart';

class CleanArchitectureSample extends StatelessWidget {
  const CleanArchitectureSample({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.I.configureScreen(MediaQuery.of(context).size);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConfigUtil.I.appTitle,
      theme: lightTheme,
      routerDelegate: NavigationUtil.I.routerDelegate,
      routeInformationParser: NavigationUtil.I.routeInformationParser,
    );
  }
}
