import 'package:flutter/material.dart';

class PreferredSizeAppBar extends PreferredSize {
  final Widget appBar;
  final Size size;

  const PreferredSizeAppBar({
    super.key,
    required this.appBar,
    this.size = const Size(double.maxFinite, kToolbarHeight),
  }) : super(
          child: appBar,
          preferredSize: size,
        );
}
