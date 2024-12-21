import 'package:flutter/material.dart';

import '../action/text_button_widget.dart';
import '../text/text_widget.dart';

class AppBarTextButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final EdgeInsets? padding;

  const AppBarTextButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = TextButtonWidget(
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
