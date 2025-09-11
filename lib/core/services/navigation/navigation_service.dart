import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../config/routes/routes.dart';
import '../../data_handling/data_handler.dart';

abstract class NavigationService {
  RouterDelegate<Object>? get routerDelegate;
  RouteInformationParser<Object>? get routeInformationParser;
  GlobalKey<NavigatorState> get navigatorKey;
  Future<bool> popTop<T extends Object?>([T? result]);
  Future<void> replaceAllRoute(PageRouteInfo<dynamic> route);
  Future<T?> pushRoute<T>(PageRouteInfo<dynamic> route);
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

  /// Removes the top most page from the stack
  @override
  Future<bool> popTop<T extends Object?>([T? result]) async =>
      await _appRouter.maybePopTop(result);

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
}

/// A util class for accessing [NavigationService]
class NavigationUtil {
  NavigationUtil._();

  /// Returns the registered instance of [NavigationService] which is always the same
  static NavigationService get I => GetIt.I<NavigationService>();
}
