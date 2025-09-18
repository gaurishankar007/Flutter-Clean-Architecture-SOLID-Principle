import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../text/base_text.dart';

class BaseTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color? textColor;
  final TextType? textType;
  final FontWeight? textFontWeight;
  final Color? color;
  final EdgeInsets? padding;
  final VisualDensity? visualDensity;
  final double? elevation;

  const BaseTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.textType,
    this.textFontWeight,
    this.color,
    this.padding,
    this.visualDensity,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: padding,
        visualDensity: visualDensity,
        elevation: elevation,
      ),
      child: BaseText(
        text,
        color: textColor ?? AppColors.hightLight,
        textType: textType ?? TextType.bodyLarge,
        fontWeight: textFontWeight ?? FontWeight.w400,
      ),
    );
  }
}
