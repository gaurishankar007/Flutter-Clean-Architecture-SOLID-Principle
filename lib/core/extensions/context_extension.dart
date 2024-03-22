import 'package:flutter/material.dart';

import '../constants/colors.dart';

extension ContextExtension on BuildContext {
  /// This will help to rebuild the widget whenever app theme is changed
  ThemeData get listenThemeChanges => Theme.of(this);
  Brightness get brightness => listenThemeChanges.brightness;

  /// Get background color according to the theme mode
  Color surfaceColor({Color? light, Color? dark}) =>
      brightness == Brightness.light ? light ?? white : dark ?? black;

  /// Get color of the item lying upon background according to the theme mode
  Color onSurfaceColor({Color? light, Color? dark}) =>
      brightness == Brightness.light ? dark ?? black : light ?? white;
}
