import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/ui_helpers.dart';

part 'theme_data.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  colorScheme: colorScheme,
  fontFamily: "Poppins",
  scaffoldBackgroundColor: AppColors.surface,
  appBarTheme: appBarTheme,
  inputDecorationTheme: inputDecorationTheme,
  checkboxTheme: checkBoxThemeData,
  listTileTheme: listTileThemeData,
);
