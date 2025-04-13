import 'package:auto_route/auto_route.dart';

import '../../../core/services/app_session_service.dart';
import '../routes.gr.dart';

class AuthGuard extends AutoRouteGuard {
  const AuthGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (AppSessionUtil.I.isLoggedIn) return resolver.next(true);

    router.replaceAll([const LoginRoute()]);
  }
}
