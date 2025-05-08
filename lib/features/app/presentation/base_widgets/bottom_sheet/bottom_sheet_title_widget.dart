import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../../../core/utils/screen_util/screen_util.dart';
import '../../widgets/title_widget.dart';
import '../action/icon_button_widget.dart';

class BottomSheetTitleWidget extends StatelessWidget {
  final String title;
  const BottomSheetTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenUtil.I.pagePadding().copyWith(top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: TitleWidget(title: title)),
          IconButtonWidget(
            onPressed: NavigationUtil.I.popTop,
            disableSplash: true,
            icon: const Icon(
              AppIcons.close,
              size: 20,
              color: AppColors.black,
            ),
          )
        ],
      ),
    );
  }
}
