import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const white = Colors.white;
  static const black = Colors.black;
  static const blackE1 = Color(0xFF1E1E1E);
  static final black05 = Colors.black.withOpacity(.05);
  static final black10 = Colors.black.withOpacity(.1);
  static final black15 = Colors.black.withOpacity(.15);
  static final black20 = Colors.black.withOpacity(.2);
  static final black25 = Colors.black.withOpacity(.25);
  static final black60 = Colors.black.withOpacity(.6);
  static final black70 = Colors.black.withOpacity(.7);
  static final black95 = Colors.black.withOpacity(.95);

  // Border of text field, drop down
  static const border = Color(0XFFDBE1E5);
  static const dashedBorder = Color(0XFFB0B0B0);

  // Random
  static const base = Color(0xFF121212);
  static const fade = Color(0xFF5E6A75);
  static const hightLight = Color(0xFF254EDB);
  static const iconContainer = Color(0xFFFEF3EB);

  // Color Scheme
  static const primary = Color(0xFF003399);
  static const secondary = Color(0xFF263A43);
  static const surface = white;
  static const onSurface = base;
  static const error = Color(0xFFE20A17);

  // Green
  static const success = Color(0xFF109335);
  static const green500 = Color(0xFF16B364);

  // Red
  static const red500 = Color(0xFFFF4405);
  static const red600 = Color(0xFFD92D20);

  // Orange
  static const warning = Color(0xFFF97316);
}
