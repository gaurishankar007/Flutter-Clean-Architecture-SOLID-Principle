import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant.dart';

CustomRoute slidingRoute({
  required PageInfo<dynamic> page,
  required String? path,
  required AxisDirection direction,
}) {
  late Offset beginOffset;

  switch (direction) {
    case AxisDirection.up:
      beginOffset = const Offset(0, 1);
      break;

    case AxisDirection.down:
      beginOffset = const Offset(0, -1);
      break;

    case AxisDirection.right:
      beginOffset = const Offset(-1, 0);
      break;

    case AxisDirection.left:
      beginOffset = const Offset(1, 0);
      break;
  }

  return CustomRoute(
    page: page,
    path: path,
    durationInMilliseconds: pageTransitionDuration.inMilliseconds,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
