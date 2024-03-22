import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../injector/injector.dart';
import '../../../../widgets/glass/glass_layer_container.dart';
import '../../../../widgets/preferred_size_app_bar.dart';
import '../widgets/drawer/drawer_app_bar_items.dart';
import '../widgets/drawer/drawer_logout_button.dart';
import '../widgets/drawer/drawer_navigation_container.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = drawerColor(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSizeAppBar(
        appBar: GlassLayerContainer(
          backgroundColor: backgroundColor,
          height: kToolbarHeight + screen.statusBarHeight,
          padding: EdgeInsets.only(
            top: screen.statusBarHeight,
            left: screen.horizontalPadding,
            right: screen.horizontalPadding,
          ),
          child: const DrawerAppBarItems(),
        ),
      ),
      body: const DrawerNavigationContainer(),
      floatingActionButton: const DrawerLogoutButton(),
    );
  }
}
