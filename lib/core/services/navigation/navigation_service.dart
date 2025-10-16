import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../routing/routes.dart';
import '../../data_handling/data_handler.dart';

abstract class NavigationService {
  RouterDelegate<Object>? get routerDelegate;
  RouteInformationParser<Object>? get routeInformationParser;
  GlobalKey<NavigatorState> get navigatorKey;
  String get currentPath;
  Future<bool> maybePop<T extends Object?>([T? result]);
  Future<bool> maybePopTop<T extends Object?>([T? result]);
  void back();
  Future<void> replaceAllRoute(PageRouteInfo<dynamic> route);
  Future<T?> pushRoute<T>(PageRouteInfo<dynamic> route);
  Future<T?> pushPlatformRoute<T>({
    PageRouteInfo<dynamic>? androidRoute,
    PageRouteInfo<dynamic>? iOSRoute,
    PageRouteInfo<dynamic>? webRoute,
  });
  Future<T?> replaceRoute<T>(PageRouteInfo<dynamic> route);
}

@module
abstract class NavigationServiceModule {
  @lazySingleton
  AppRouter get appRouter => AppRouter();
}

@LazySingleton(as: NavigationService)
class NavigationServiceImpl implements NavigationService {
  final AppRouter _appRouter;

  NavigationServiceImpl({required AppRouter appRouter})
    : _appRouter = appRouter;

  /// A delegate that configures a widget, typically a [Navigator]
  @override
  RouterDelegate<Object>? get routerDelegate => _appRouter.delegate();

  /// A delegate to parse the route information
  @override
  RouteInformationParser<Object>? get routeInformationParser =>
      _appRouter.defaultRouteParser();

  /// Get Navigator key from auto router
  @override
  GlobalKey<NavigatorState> get navigatorKey => _appRouter.navigatorKey;

  /// Get the name of the currentName
  @override
  String get currentPath => _appRouter.currentPath;

  /// Pops the last route in the current router's stack.
  /// This is "safe" versions of pop that checks if popping is possible before attempting.
  ///
  /// Example:
  ///
  /// Root Router [HomeRoute]
  ///
  ///  └─ Nested Router [ProfileRoute, SettingsRoute, AboutRoute]
  ///
  /// maybePop() → Removes AboutRoute (innermost router)
  @override
  Future<bool> maybePop<T extends Object?>([T? result]) async =>
      await _appRouter.maybePop(result);

  /// Pops from the topmost/root router in the hierarchy.
  /// This is "safe" versions of popTop that checks if popping is possible before attempting.
  ///
  /// Example:
  ///
  /// Root Router [HomeRoute, DashboardRoute]
  ///
  /// └─ Nested Router [ProfileRoute, SettingsRoute, AboutRoute]
  ///
  /// maybePopTop() → Removes DashboardRoute (root router)
  @override
  Future<bool> maybePopTop<T extends Object?>([T? result]) async =>
      await _appRouter.maybePopTop(result);

  /// Automatically chooses between pop/popTop based on context.
  /// High-level navigation method that handles both Flutter navigation AND browser history.
  /// On web, it properly syncs with browser back button.
  @override
  void back() => _appRouter.back();

  /// Replace all previous routes the new route
  @override
  Future<void> replaceAllRoute(PageRouteInfo<dynamic> route) async {
    try {
      await _appRouter.replaceAll([route]);
    } catch (error, stackTrace) {
      ErrorHandler.debugError(error, stackTrace);
    }
  }

  /// Adds the corresponding page to the given route
  @override
  Future<T?> pushRoute<T>(PageRouteInfo<dynamic> route) async {
    try {
      return await _appRouter.push(route);
    } catch (error, stackTrace) {
      ErrorHandler.debugError(error, stackTrace);
      return null;
    }
  }

  /// Adds the corresponding page to the given route based on the current platform
  @override
  Future<T?> pushPlatformRoute<T>({
    PageRouteInfo<dynamic>? androidRoute,
    PageRouteInfo<dynamic>? iOSRoute,
    PageRouteInfo<dynamic>? webRoute,
    String? platform,
  }) async {
    try {
      platform ??= kIsWeb
          ? 'web'
          : Platform.isAndroid
          ? 'android'
          : Platform.isIOS
          ? 'ios'
          : null;

      if (webRoute != null && platform == 'web') {
        return await _appRouter.push(webRoute);
      } else if (androidRoute != null && platform == 'android') {
        return await _appRouter.push(androidRoute);
      } else if (iOSRoute != null && platform == 'ios') {
        return await _appRouter.push(iOSRoute);
      }
      return null;
    } catch (error, stackTrace) {
      ErrorHandler.debugError(error, stackTrace);
      return null;
    }
  }

  @override
  Future<T?> replaceRoute<T>(PageRouteInfo route) async {
    try {
      return await _appRouter.replace(route);
    } catch (error, stackTrace) {
      ErrorHandler.debugError(error, stackTrace);
      return null;
    }
  }
}

/// A util class for accessing [NavigationService]
class NavigationUtil {
  NavigationUtil._();

  /// Returns the registered instance of [NavigationService] which is always the same
  static NavigationService get I => GetIt.I<NavigationService>();
}
