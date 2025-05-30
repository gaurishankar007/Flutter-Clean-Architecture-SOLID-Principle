import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/ui_helpers.dart';
import '../text/text_widget.dart';

class CheckBoxWidget extends StatelessWidget {
  final double? scale;
  final bool value;
  final Function(bool?)? onChanged;
  final String? title;

  const CheckBoxWidget({
    super.key,
    this.scale = .85,
    required this.value,
    this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Transform.scale(
      scale: scale,
      child: Checkbox(
        value: value,
        fillColor: WidgetStateColor.resolveWith(
          (states) => value ? AppColors.hightLight : Colors.transparent,
        ),
        side:
            value ? null : const BorderSide(width: 1.2, color: AppColors.black),
        onChanged: onChanged,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );

    if (title != null) {
      final textColor = value ? AppColors.hightLight : AppColors.base;
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          UIHelpers.xSmallHSpace,
          TextWidget(title!, color: textColor, fontWeight: FontWeight.w500),
        ],
      );
    }

    return child;
  }
}
