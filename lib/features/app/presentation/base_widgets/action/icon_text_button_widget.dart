import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/ui_helpers.dart';
import '../text/text_widget.dart';

class IconTextButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final IconData iconData;
  final String text;
  final Color? iconColor;
  final double? iconSize;
  final Color? textColor;

  const IconTextButtonWidget({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.text,
    this.iconColor,
    this.iconSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Color newIconColor = iconColor ?? AppColors.base;

    return InkWell(
      onTap: onPressed,
      borderRadius: UIHelpers.xxSmallCRadius,
      child: Padding(
        padding: UIHelpers.xxSmallAllPadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: newIconColor,
              size: iconSize,
            ),
            UIHelpers.xxSmallHSpace,
            TextWidget(text, color: textColor),
          ],
        ),
      ),
    );
  }
}
