import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../../../core/utils/screen_util/screen_util.dart';
import '../../../../../core/utils/ui_helpers.dart';
import '../action/icon_button_widget.dart';
import '../text/text_widget.dart';

class AppBarWidget extends StatelessWidget {
  final bool showLeading;
  final Widget? leading;
  final String title;
  final FontWeight? titleFontWeight;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final List<Widget>? actions;

  const AppBarWidget({
    super.key,
    this.showLeading = true,
    this.leading,
    required this.title,
    this.titleFontWeight,
    this.titleStyle,
    this.centerTitle = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    // AppBar padding
    double horizontalPadding = ScreenUtil.I.horizontalSpace;
    // AppBar leading height and width
    double leadingSize = 25;
    // The maximum width of the AppBar leading
    double leadingWidth = showLeading ? horizontalPadding + leadingSize : 0;
    // Space between Leading and title
    double titleSpacing = showLeading ? 8 : horizontalPadding;

    Widget? leadingWidget;
    Widget? titleWidget;

    if (showLeading) {
      leadingWidget = Padding(
        padding: UIHelpers.screenLPadding,
        child: leading ??
            IconButtonWidget(
              onPressed: NavigationUtil.I.popTop,
              icon: const Icon(
                AppIcons.arrow_left,
                size: 20,
                color: AppColors.base,
              ),
              disableSplash: true,
            ),
      );
    }

    if (title.isNotEmpty) {
      titleWidget = TextWidget.bodyLarge(
        title,
        color: AppColors.black,
        fontWeight: titleFontWeight,
      );
    }

    return AppBar(
      automaticallyImplyLeading: false,
      leading: leadingWidget,
      leadingWidth: leadingWidth,
      titleSpacing: titleSpacing,
      title: titleWidget,
      centerTitle: centerTitle,
      actions: actions,
    );
  }
}
