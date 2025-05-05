import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/ui_helpers.dart';
import '../../../app/presentation/base_widgets/text/text_widget.dart';

class WelcomeLogoWidget extends StatelessWidget {
  final String title;
  const WelcomeLogoWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: UIHelpers.xxSmallTxLargeBPadding,
          child: const TextWidget(
            "Welcome",
            color: AppColors.primary,
            textType: TextType.headlineLarge,
            fontWeight: FontWeight.w900,
          ),
        ),
        UIHelpers.mediumVSpace,
        Align(
          alignment: Alignment.centerLeft,
          child: TextWidget.titleMedium(title, color: AppColors.blackE1),
        ),
      ],
    );
  }
}
