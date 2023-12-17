import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/dashboard/presentation/cubit/dashboard_cubit.dart';

class DashNavObserver extends AutoRouterObserver {
  final BuildContext context;

  DashNavObserver(this.context);

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (previousRoute != null) {
      String? subNavHref = route.settings.name;
      if (subNavHref != null) {}
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      String? subNavHref = previousRoute.settings.name;
      if (subNavHref != null) {
        BlocProvider.of<DashboardCubit>(context).findIndex(subNavHref);
      }
    }
  }
}