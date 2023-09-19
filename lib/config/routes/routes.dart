import 'package:auto_route/auto_route.dart';
import 'package:boilerplate/core/constants/route_path.dart';
import 'package:boilerplate/injection/injector.dart';
import 'package:boilerplate/config/routes/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  bool get _isLoggedIn => appData.tokenDataModel.accessToken.isNotEmpty;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: LoginRoute.page,
          path: kLoginP,
          initial: !_isLoggedIn,
        ),
        AutoRoute(
          path: kDashboardP,
          page: DashboardRoute.page,
          initial: _isLoggedIn,
          children: [
            AutoRoute(
              path: kHomeP,
              page: HomeRoute.page,
              initial: _isLoggedIn,
            ),
          ],
        ),
      ];
}
