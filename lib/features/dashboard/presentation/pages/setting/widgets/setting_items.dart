import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/utils/ui_helpers.dart';
import '../../../../../../shared/widgets/base/text/base_text.dart';

class SettingItems extends StatelessWidget {
  const SettingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelpers.sMediumAllPadding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: UIHelpers.smallCRadius,
        boxShadow: const [
          BoxShadow(
            color: AppColors.black15,
            blurRadius: 24,
          )
        ],
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          settingItemWidget(AppIcons.lock, "Change Password"),
        ],
      ),
    );
  }

  Widget settingItemWidget(IconData iconData, String name) {
    return Material(
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: UIHelpers.smallCRadius,
          side: const BorderSide(color: AppColors.border),
        ),
        contentPadding: UIHelpers.sMediumHxSmallVPadding,
        horizontalTitleGap: 8,
        leading: Icon(iconData, size: 22),
        title: BaseText.bodyLarge(name),
        trailing: const Icon(AppIcons.arrow_right, size: 22),
      ),
    );
  }
}
