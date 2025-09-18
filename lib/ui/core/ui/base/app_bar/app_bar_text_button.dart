import 'package:flutter/material.dart';

import '../buttons/base_text_button.dart';
import '../text/base_text.dart';

class AppBarTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final EdgeInsets? padding;

  const AppBarTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = BaseTextButton(
      onPressed: onPressed,
      text: text,
      textType: TextType.bodyLarge,
      textFontWeight: FontWeight.w500,
      visualDensity: const VisualDensity(horizontal: -3, vertical: -2),
    );

    if (padding != null) {
      return Padding(
        padding: padding!,
        child: child,
      );
    }

    return child;
  }
}
