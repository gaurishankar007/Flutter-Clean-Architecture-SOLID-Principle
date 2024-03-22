import 'package:flutter/material.dart' show debugPrint;

import '../../config/routes/routes.gr.dart';
import '../../injector/injector.dart';

part 'routes_data.dart';

/// Pops the page which is at the top of the pages stack
popPage() => appRouter.maybePopTop();

/// removes the second last page
removeLast() => appRouter.removeLast();

/// Pushes the page that matches the path name
popUntil(String routeName) => appRouter.popUntil((route) => route.settings.name == routeName);

/// Pushes the page that matches the path name
removeWhere(String routeName) => appRouter.removeWhere((route) => route.name == routeName);

/// Pushes the page that matches the path name
pushName(String path) => appRouter.pushNamed(path);

/// Pops all pages and pushes the dashboard page
replaceToDashboard() => appRouter.replaceAll([const DashboardRoute()]);

/// Pops all pages and pushes the signIn page
replaceToSignIn() => appRouter.replaceAll([SignInRoute()]);

/// Pushes the page that matches the path name
/// with or without argument
/// with route name
/// For nested navigation
pushRoute(String routePath, {dynamic arg}) {
  try {
    switch (routePath) {
      case SIGN_IN_PATH:
        return appRouter.push(SignInRoute());

      default:
        return debugPrint("Route not found.");
    }
  } catch (error) {
    return debugPrint(error.toString());
  }
}
