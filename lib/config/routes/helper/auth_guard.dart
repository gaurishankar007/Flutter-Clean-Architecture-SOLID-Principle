import 'package:auto_route/auto_route.dart';

import '../../../injector/injector.dart';
import '../routes.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final bool isLoggedIn = userService.userData.accessToken.isNotEmpty;
    if (isLoggedIn) return resolver.next(true);

    router.replaceAll([SignInRoute()]);
  }
}
