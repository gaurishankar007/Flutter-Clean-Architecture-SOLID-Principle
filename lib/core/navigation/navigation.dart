import 'package:boilerplate/core/constants/route_path.dart';
import 'package:boilerplate/injection/injector.dart';
import 'package:boilerplate/config/routes/routes.gr.dart';

navWithPath(String route, {dynamic argument}) {
  try {
    switch (route) {
      case kDashboardP:
        return appRouter.replaceAll([HomeRoute()]);

      case kLoginP:
        return appRouter.replaceAll([LoginRoute()]);

      case kHomeP:
        return appRouter.push(HomeRoute());

      default:
        return;
    }
  } catch (error) {
    // debugPrint(error);
  }
}

popPage() => appRouter.popTop();
