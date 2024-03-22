import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

import '../../core/constants/colors.dart';
import '../../core/utils/text_styles.dart';
import 'theme_data.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: colorScheme(),
  scaffoldBackgroundColor: white,
  useMaterial3: false,
  appBarTheme: appBarTheme.copyWith(
    titleTextStyle: largeMedium(black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: white,
    ),
  ),
  inputDecorationTheme: inputDecorationTheme.copyWith(
    fillColor: formFillLight,
    hintStyle: TextStyle(color: formHintLight),
  ),
  textButtonTheme: textButtonTheme,
  iconButtonTheme: iconButtonTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonLight,
      foregroundColor: black,
      splashFactory: NoSplash.splashFactory,
      surfaceTintColor: Colors.transparent,
    ),
  ),
  listTileTheme: listTileTheme,
);
