import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../base_widgets/text/text_widget.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Color? color;

  const TitleWidget({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextWidget.title(title, color: color ?? AppColors.blackE1);
  }
}
