import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_icon.dart';
import '../../../../../../core/utils/ui_helper.dart';
import '../../../../../app/presentation/base_widgets/text/text_widget.dart';

class SettingItemsWidget extends StatelessWidget {
  const SettingItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.sMediumAllPadding,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: UIHelper.smallCRadius,
        boxShadow: const [
          BoxShadow(
            color: AppColor.black15,
            blurRadius: 24,
          )
        ],
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          settingItemWidget(AppIcon.lock, "Change Password"),
        ],
      ),
    );
  }

  Widget settingItemWidget(IconData iconData, String name) {
    return Material(
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.smallCRadius,
          side: const BorderSide(color: AppColor.border),
        ),
        contentPadding: UIHelper.sMediumHxSmallVPadding,
        horizontalTitleGap: 8,
        leading: Icon(iconData, size: 22),
        title: TextWidget.bodyLarge(name),
        trailing: const Icon(AppIcon.arrow_right, size: 22),
      ),
    );
  }
}
