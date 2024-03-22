import 'package:flutter/material.dart';
import 'package:flutter_sliding_drawer/flutter_sliding_drawer.dart';

import '../core/constants/constant.dart';
import '../injector/injector.dart';

class SlidingDrawerWidget extends StatelessWidget {
  final GlobalKey<SlidingDrawerState> drawerKey;
  final Widget drawer;
  final Widget content;

  const SlidingDrawerWidget({
    super.key,
    required this.drawerKey,
    required this.drawer,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingDrawer(
      key: drawerKey,
      settings: SlidingDrawerSettings(
        drawerWidth: screen.dynamicDrawerWidth,
        animationDuration: pageTransitionDuration,
      ),
      drawerBuilder: (_) => drawer,
      contentBuilder: (_) => content,
    );
  }
}
