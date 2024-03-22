import 'package:flutter/material.dart';

import '../../core/utils/text_styles.dart';
import '../../injector/injector.dart';

class UserName extends StatelessWidget {
  final TextStyle? textStyle;
  const UserName({super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final user = userService.userData.user;
    return Text(user.name, style: textStyle ?? largeMedium());
  }
}
