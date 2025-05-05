import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/ui_helpers.dart';
import '../../../../../app/presentation/base_widgets/text/text_widget.dart';

class BlueContainerWidget extends StatelessWidget {
  const BlueContainerWidget({super.key});

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
      child: TextWidget.headline(
        "Settings",
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
