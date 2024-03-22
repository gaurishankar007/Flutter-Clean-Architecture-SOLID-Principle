import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/extensions/int_extension.dart';
import '../../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../../widgets/user/user_image.dart';
import '../../../../../widgets/user/user_name.dart';

class DrawerAppBarItems extends StatelessWidget {
  const DrawerAppBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserCircularImage(diameter: 40.pWConstraint(max: 45, min: 38)),
        SizedBox(width: 10.pWConstraint(max: 15)),
        const UserName(),
        const Spacer(),
        CustomIconButton(
          onPressed: () {},
          disableSplash: true,
          icon: Icon(Icons.settings_rounded, color: primaryColor, size: appBarIconSize),
        ),
      ],
    );
  }
}
