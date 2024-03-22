import '../../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/extensions/int_extension.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../domain/entities/dashboard_navigator.dart';

class DrawerNavigationItem extends StatelessWidget {
  final bool selected;
  final DashboardNavigator navigationItem;

  const DrawerNavigationItem({
    super.key,
    required this.selected,
    required this.navigationItem,
  });

  @override
  Widget build(BuildContext context) {

    /// Color of the drawer navigation item
    Color backgroundColor = Colors.transparent;
    if (selected) backgroundColor =context. surfaceColor(light: f5f5f5, dark: const Color(0XFF575757));

    Color iconContainerColor =
      context.  surfaceColor(light: const Color(0XFFEBEBEB), dark: const Color(0XFF767676));

    return Ink(
      padding: EdgeInsets.all(padding10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(border15),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(padding8),
            height: 40.pWConstraint(max: 45, min: 38),
            width: 40.pWConstraint(max: 45, min: 38),
            decoration: BoxDecoration(
              color: iconContainerColor,
              borderRadius: BorderRadius.circular(border10),
            ),
            child: Icon(navigationItem.iconData, size: 20),
          ),
          SizedBox(width: 15.pWConstraint(max: 15)),
          Text(navigationItem.name, style: largeMedium())
        ],
      ),
    );
  }
}
