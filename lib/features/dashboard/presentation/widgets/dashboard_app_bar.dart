import 'package:flutter/material.dart';
import 'package:flutter_sliding_drawer/flutter_sliding_drawer.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../injector/injector.dart';
import '../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../widgets/glass/glass_layer_container.dart';
import '../inheritedWidget/drawer_key_inherited_widget.dart';

class DashboardAppBar extends StatelessWidget {
  final bool showActionButton;
  final String title;
  const DashboardAppBar({
    super.key,
    required this.title,
    this.showActionButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final drawerKey = DrawerKeyInheritedWidget.of(context).drawerKey;

    return GlassLayerContainer(
      height: kToolbarHeight + screen.statusBarHeight,
      padding: EdgeInsets.only(
        top: screen.statusBarHeight,
        left: screen.horizontalPadding,
        right: screen.horizontalPadding,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomIconButton(
              onPressed: () => drawerKey.open(),
              disableSplash: true,
              icon: Icon(Icons.menu_rounded, color: primaryColor, size: appBarIconSize),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(title, style: largeSemibold()),
          ),
          if (showActionButton)
            Align(
              alignment: Alignment.centerRight,
              child: CustomIconButton(
                onPressed: () {},
                disableSplash: true,
                icon: Icon(Icons.edit_square, color: primaryColor, size: appBarIconSize),
              ),
            ),
        ],
      ),
    );
  }
}
