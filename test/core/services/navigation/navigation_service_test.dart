import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture/core/config/routes/routes.dart';
import 'package:clean_architecture/core/services/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_support/mocks/external/router_mocks.dart';

// Concrete fake class for RouterDelegate
class FakeRouterDelegate extends AutoRouterDelegate {
  FakeRouterDelegate() : super(AppRouter());

  @override
  Widget build(BuildContext context) => Container();
}

void main() {
  late MockAppRouter mockAppRouter;
  late NavigationServiceImpl navigationService;

  setUpAll(() {
    mockAppRouter = MockAppRouter();
    navigationService = NavigationServiceImpl(appRouter: mockAppRouter);
  });

  test('routerDelegate returns delegate from AppRouter', () {
    final delegate = FakeRouterDelegate();
    when(() => mockAppRouter.delegate()).thenReturn(delegate);

    expect(navigationService.routerDelegate, delegate);
    verify(() => mockAppRouter.delegate()).called(1);
  });

  test('routeInformationParser returns parser from AppRouter', () {
    final parser = MockDefaultRouteParser();
    when(() => mockAppRouter.defaultRouteParser()).thenReturn(parser);

    expect(navigationService.routeInformationParser, parser);
    verify(() => mockAppRouter.defaultRouteParser()).called(1);
  });

  test('navigatorKey returns navigatorKey from AppRouter', () {
    final key = GlobalKey<NavigatorState>();
    when(() => mockAppRouter.navigatorKey).thenReturn(key);

    expect(navigationService.navigatorKey, key);
    verify(() => mockAppRouter.navigatorKey).called(1);
  });

  test('popTop calls maybePopTop on AppRouter', () async {
    when(
      () => mockAppRouter.maybePopTop<Object?>(null),
    ).thenAnswer((_) async => true);

    final result = await navigationService.popTop<Object?>();

    expect(result, true);
    verify(() => mockAppRouter.maybePopTop<Object?>(null)).called(1);
  });

  test('replaceAllRoute calls replaceAll on AppRouter', () async {
    final route = MockPageRouteInfo();
    when(() => mockAppRouter.replaceAll([route])).thenAnswer((_) async {});

    await navigationService.replaceAllRoute(route);

    verify(() => mockAppRouter.replaceAll([route])).called(1);
  });

  test('pushRoute calls push on AppRouter and returns result', () async {
    final route = MockPageRouteInfo();
    when(
      () => mockAppRouter.push<Object?>(route),
    ).thenAnswer((_) async => 'result');

    final result = await navigationService.pushRoute<Object?>(route);

    expect(result, 'result');
    verify(() => mockAppRouter.push<Object?>(route)).called(1);
  });

  test(
    'pushPlatformRoute calls push on AppRouter and returns result',
    () async {
      final route = MockPageRouteInfo();
      final webRoute = MockPageRouteInfo();

      when(
        () => mockAppRouter.push<Object?>(route),
      ).thenAnswer((_) async => 'result');

      final result = await navigationService.pushPlatformRoute<Object?>(
        androidRoute: route,
        iOSRoute: route,
        webRoute: webRoute,
        platform: 'ios',
      );

      expect(result, 'result');
      verify(() => mockAppRouter.push<Object?>(route)).called(1);
    },
  );

  test('pushRoute returns null and logs error if push throws', () async {
    final route = MockPageRouteInfo();
    when(() => mockAppRouter.push<Object?>(route)).thenThrow(Exception('fail'));

    final result = await navigationService.pushRoute<Object?>(route);

    expect(result, null);
    verify(() => mockAppRouter.push<Object?>(route)).called(1);
  });

  test('replaceAllRoute logs error if replaceAll throws', () async {
    final route = MockPageRouteInfo();
    when(() => mockAppRouter.replaceAll([route])).thenThrow(Exception('fail'));

    // Should not throw
    await navigationService.replaceAllRoute(route);

    verify(() => mockAppRouter.replaceAll([route])).called(1);
  });
}
