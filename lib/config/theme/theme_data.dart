part of 'theme.dart';

/// Color Scheme
ColorScheme get colorScheme => ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      surface: AppColor.surface,
      onSurface: AppColor.onSurface,
      error: AppColor.error,
    );

/// App ar Theme
AppBarTheme get appBarTheme => const AppBarTheme(
      backgroundColor: AppColor.white,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColor.black),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

/// InputDecoration Theme
OutlineInputBorder outlinedInputBorder(Color color) => OutlineInputBorder(
      borderRadius: UIHelper.smallCRadius,
      borderSide: BorderSide(color: color, width: 2),
    );
InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
      hintStyle: const TextStyle(color: AppColor.fade, fontSize: 14),
      enabledBorder: outlinedInputBorder(AppColor.border),
      focusedBorder: outlinedInputBorder(AppColor.primary),
      errorBorder: outlinedInputBorder(AppColor.red600),
      focusedErrorBorder: outlinedInputBorder(AppColor.red600),
    );

/// CheckBox Theme
CheckboxThemeData get checkBoxThemeData => CheckboxThemeData(
      visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
      shape: RoundedRectangleBorder(borderRadius: UIHelper.xxSmallCRadius),
    );

/// ListTile Theme
ListTileThemeData get listTileThemeData => const ListTileThemeData(
      dense: true,
      contentPadding: EdgeInsets.zero,
      // If zero is given than it will take default top padding
      minVerticalPadding: 1,
      horizontalTitleGap: 0,
      minLeadingWidth: 0,
    );
