import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../shared_ui/utils/ui_helpers.dart';
import '../../../../../../shared_ui/ui/base/text/base_text.dart';

class BlueContainer extends StatelessWidget {
  const BlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.maxFinite,
      padding: UIHelpers.screenHsMediumVPadding,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: UIHelpers.largeBRadius,
      ),
      child: BaseText.headline(
        "Settings",
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
