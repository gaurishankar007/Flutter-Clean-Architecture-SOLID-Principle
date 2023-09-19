import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/injection/injector.dart';

OutlineInputBorder outlineIB(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(size.pSW(6)),
      borderSide: BorderSide(color: color),
    );

ThemeData lightTheme = ThemeData(
  primaryColor: kP,
  colorScheme: ColorScheme.fromSeed(seedColor: kP),
  fontFamily: "Poppins",
  scaffoldBackgroundColor: kWhite,
  appBarTheme: AppBarTheme(
    backgroundColor: kWhite,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: kP,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: outlineIB(kGrey1),
    focusedBorder: outlineIB(kP),
    errorBorder: outlineIB(kR600),
  ),
  checkboxTheme: CheckboxThemeData(
    visualDensity: VisualDensity(horizontal: -3, vertical: -3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(size.pSW(2)),
    ),
  ),
  listTileTheme: ListTileThemeData(
    dense: true,
    contentPadding: EdgeInsets.zero,
    // If zero is given than it will take default top padding
    minVerticalPadding: 1,
    horizontalTitleGap: 0,
    minLeadingWidth: 0,
    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
  ),
);
