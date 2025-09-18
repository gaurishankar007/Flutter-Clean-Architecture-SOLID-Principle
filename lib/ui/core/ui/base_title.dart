import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'base/text/base_text.dart';

class BaseTitle extends StatelessWidget {
  final String title;
  final Color? color;

  const BaseTitle({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BaseText.title(title, color: color ?? AppColors.blackE1);
  }
}
