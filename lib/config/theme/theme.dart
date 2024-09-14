import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_color.dart';
import '../../core/utils/ui_helper.dart';

part 'theme_data.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColor.primary,
  colorScheme: colorScheme,
  fontFamily: "Poppins",
  scaffoldBackgroundColor: AppColor.surface,
  appBarTheme: appBarTheme,
  inputDecorationTheme: inputDecorationTheme,
  checkboxTheme: checkBoxThemeData,
  listTileTheme: listTileThemeData,
);
