import '../../../../../injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_drawer/flutter_sliding_drawer.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/navigation/navigator.dart';
import '../../inheritedWidget/drawer_key_inherited_widget.dart';

class DrawerLogoutButton extends StatelessWidget {
  const DrawerLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerKey = DrawerKeyInheritedWidget.of(context).drawerKey;

    return FloatingActionButton(
      onPressed: () async {
        drawerKey.close();
        localDatabase.clearAll();
        replaceToSignIn();
      },
      backgroundColor: primaryColor,
      elevation: 0,
      child: Icon(Icons.logout_rounded, color: white, size: appBarIconSize),
    );
  }
}
