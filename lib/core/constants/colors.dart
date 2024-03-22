import '../extensions/context_extension.dart';
import 'package:flutter/material.dart' show BuildContext, Color, Colors;

/// <===== Base Colors  =====>
Color get white => Colors.white;
Color get black => Colors.black;
Color get green => Colors.green;
Color get purple => Colors.purple;

/// <===== Color Schemes =====>
Color get primaryColor => Colors.indigo;
Color get errorColor => const Color(0XFFD92D20);

/// <===== Reusable Colors =====>
Color get f5f5f5 => const Color(0XFFF5F5F5);

/// <===== TextForm =====>
Color get formFillLight => f5f5f5;
Color get formFillDark => const Color(0XFF2F2F2F);
Color get formHintLight => const Color(0XFF7B7B7B);
Color get formHintDark => const Color(0XFF888888);

/// <===== Button =====>
Color get buttonLight => f5f5f5;
Color get buttonDark => const Color(0XFF4B4B4B);

Color drawerColor(BuildContext context) =>
    context.surfaceColor(light: Colors.white, dark: const Color(0XFF303030));
Color popUpColor(BuildContext context) =>
    context.surfaceColor(light: f5f5f5, dark: const Color(0XFF222222));
Color onPopUpColor(BuildContext context) =>
    context.surfaceColor(light: Colors.white, dark: const Color(0XFF333333));
