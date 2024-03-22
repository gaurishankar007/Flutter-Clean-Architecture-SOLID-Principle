import '../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import 'glass_layer.dart';

class GlassLayerContainer extends StatelessWidget {
  final double opacity;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? height;
  final EdgeInsets? padding;
  final double blur;
  final Widget child;

  const GlassLayerContainer({
    super.key,
    this.opacity = .05,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.height,
    this.padding,
    this.blur = 5,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Color containerColor = backgroundColor ?? context.surfaceColor();

    Widget newChild = Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: containerColor.withOpacity(opacity),
        borderRadius: borderRadius,
        border: border,
      ),
      child: child,
    );

    return GlassLayer(borderRadius: borderRadius, blur: blur, child: newChild);
  }
}
