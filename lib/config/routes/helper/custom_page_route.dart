import 'package:flutter/material.dart';

import '../../../core/constants/constant.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomPageRoute({
    required this.child,
    required this.direction,
  }) : super(
          transitionDuration: Duration(milliseconds: pageTransitionDuration.inMilliseconds),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: _getOffset(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

  Offset _getOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}
