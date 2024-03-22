import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

import '../../core/constants/colors.dart';
import '../../core/utils/text_styles.dart';
import 'theme_data.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: colorScheme(dark: true),
  scaffoldBackgroundColor: black,
  useMaterial3: false,
  appBarTheme: appBarTheme.copyWith(
    titleTextStyle: largeMedium(white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: black,
    ),
  ),
  inputDecorationTheme: inputDecorationTheme.copyWith(
    fillColor: formFillDark,
    hintStyle: TextStyle(color: formHintDark),
  ),
  textButtonTheme: textButtonTheme,
  iconButtonTheme: iconButtonTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonDark,
      foregroundColor: white,
      splashFactory: NoSplash.splashFactory,
    ),
  ),
  listTileTheme: listTileTheme,
);
