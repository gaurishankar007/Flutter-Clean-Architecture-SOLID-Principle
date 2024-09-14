import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../app/presentation/base_widgets/text/text_widget.dart';

class WelcomeLogoWidget extends StatelessWidget {
  final String title;
  const WelcomeLogoWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: UIHelper.xxSmallTxLargeBPadding,
          child: const TextWidget(
            "Welcome",
            color: AppColor.primary,
            textType: TextType.headlineLarge,
            fontWeight: FontWeight.w900,
          ),
        ),
        UIHelper.mediumVSpace,
        Align(
          alignment: Alignment.centerLeft,
          child: TextWidget.titleMedium(title, color: AppColor.blackE1),
        ),
      ],
    );
  }
}
