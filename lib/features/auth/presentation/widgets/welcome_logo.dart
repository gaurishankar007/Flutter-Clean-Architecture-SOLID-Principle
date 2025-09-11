import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/ui_helpers.dart';
import '../../../../shared/widgets/base/text/base_text.dart';

class WelcomeLogo extends StatelessWidget {
  final String title;
  const WelcomeLogo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: UIHelpers.xxSmallTxLargeBPadding,
          child: const BaseText(
            "Welcome",
            color: AppColors.primary,
            textType: TextType.headlineLarge,
            fontWeight: FontWeight.w900,
          ),
        ),
        UIHelpers.mediumVSpace,
        Align(
          alignment: Alignment.centerLeft,
          child: BaseText.titleMedium(title, color: AppColors.blackE1),
        ),
      ],
    );
  }
}
