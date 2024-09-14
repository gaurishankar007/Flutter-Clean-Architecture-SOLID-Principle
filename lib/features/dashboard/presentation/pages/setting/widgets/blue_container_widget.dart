import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/utils/ui_helper.dart';
import '../../../../../app/presentation/base_widgets/text/text_widget.dart';

class BlueContainerWidget extends StatelessWidget {
  const BlueContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.maxFinite,
      padding: UIHelper.screenHsMediumVPadding,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: UIHelper.largeBRadius,
      ),
      child: TextWidget.headline(
        "Settings",
        color: AppColor.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
