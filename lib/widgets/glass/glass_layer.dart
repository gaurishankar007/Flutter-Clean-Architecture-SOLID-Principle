import 'dart:ui';

import 'package:flutter/material.dart';

class GlassLayer extends StatelessWidget {
  final double blur;
  final BorderRadius? borderRadius;
  final Widget child;

  const GlassLayer({
    super.key,
    this.borderRadius,
    this.blur = 5,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      ),
    );
  }
}
