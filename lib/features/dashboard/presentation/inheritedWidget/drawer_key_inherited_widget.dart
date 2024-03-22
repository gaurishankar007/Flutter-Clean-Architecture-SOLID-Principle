import 'package:flutter/material.dart';
import 'package:flutter_sliding_drawer/flutter_sliding_drawer.dart';

class DrawerKeyInheritedWidget extends InheritedWidget {
  /// Key for closing and opening the drawer
  final GlobalKey<SlidingDrawerState> drawerKey;

  const DrawerKeyInheritedWidget({
    super.key,
    required super.child,
    required this.drawerKey,
  });

  static DrawerKeyInheritedWidget? _maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DrawerKeyInheritedWidget>();

  static DrawerKeyInheritedWidget of(BuildContext context) {
    final inheritedDrawerKey = _maybeOf(context);
    assert(inheritedDrawerKey != null, "No drawer key found in the widget tree");
    return inheritedDrawerKey!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
