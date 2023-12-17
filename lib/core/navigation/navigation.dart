import '../../config/routes/routes.gr.dart';
import '../../injection/injector.dart';
import '../constants/route_path.dart';

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
    return;
  }
}

popPage() => appRouter.popTop();
