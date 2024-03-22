import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onPressed;
  final Icon icon;
  final EdgeInsets? padding;
  final bool disableSplash;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.padding,
    this.disableSplash = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = IconButton(
      onPressed: onPressed,
      focusColor: Colors.transparent,
      padding: padding ?? EdgeInsets.zero,
      constraints: const BoxConstraints(),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      highlightColor: disableSplash ? Colors.transparent : null,
      icon: icon,
    );

    if (disableSplash) {
      child = Theme(
        data: ThemeData(splashFactory: NoSplash.splashFactory),
        child: child,
      );
    }

    return child;
  }
}
