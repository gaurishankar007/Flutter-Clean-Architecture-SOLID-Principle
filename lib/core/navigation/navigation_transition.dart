import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

CustomRoute navigationTransition({
  required PageInfo<dynamic> page,
  required String? path,
  required AxisDirection direction,
}) {
  late Offset beginOffset;

  switch (direction) {
    case AxisDirection.up:
      beginOffset = Offset(0, 1);
      break;

    case AxisDirection.down:
      beginOffset = Offset(0, -1);
      break;

    case AxisDirection.right:
      beginOffset = Offset(-1, 0);
      break;

    case AxisDirection.left:
      beginOffset = Offset(1, 0);
      break;
  }

  return CustomRoute(
    page: page,
    path: path,
    durationInMilliseconds: 300,
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
