import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/services/navigation/navigation_service.dart';
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
        boxShadow: [
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
          settingItemWidget(
            CHANGE_PASSWORD_PATH,
            AppIcons.lock,
            "Change Password",
          ),
        ],
      ),
    );
  }

  Widget settingItemWidget(String path, IconData iconData, String name) {
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
        trailing: const Icon(AppIcons.arrow_right, size: 22),
      ),
    );
  }
}
