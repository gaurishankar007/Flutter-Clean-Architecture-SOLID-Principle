import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

/// <===== Color Schemes =====>
ColorScheme colorScheme({bool dark = false}) {
  return ColorScheme.fromSeed(
    brightness: dark ? Brightness.dark : Brightness.light,
    seedColor: primaryColor,
  );
}

/// <===== AppBarTheme =====>
AppBarTheme get appBarTheme => const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
    );

/// <===== TextFormField InputDecoration =====>
/// Border
OutlineInputBorder get outlineBorder => OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );

/// Input Decoration
InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
      filled: true,
      enabledBorder: outlineBorder,
      focusedBorder: outlineBorder,
      errorBorder: outlineBorder,
      focusedErrorBorder: outlineBorder,
      disabledBorder: outlineBorder,
    );

/// <===== TextButton Theme Style =====>
TextButtonThemeData get textButtonTheme => TextButtonThemeData(
      style: TextButton.styleFrom(
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        foregroundColor: primaryColor,
      ),
    );

/// <===== TextButton Theme Style =====>
IconButtonThemeData get iconButtonTheme => IconButtonThemeData(
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        splashFactory: NoSplash.splashFactory,
      ),
    );

/// <===== ListTile Theme Style =====>
ListTileThemeData get listTileTheme => const ListTileThemeData(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
    );
