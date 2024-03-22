import '../../injector/injector.dart';

extension IntegerExtension on int {
  /// Required percentage of height according the screen height
  double get hPercentage => screen.heightPercentage(toDouble());

  /// Required percentage of width according the screen width
  double get wPercentage => screen.widthPercentage(toDouble());

  /// proportionate height of the screen according the height of the Design (Figma)
  double get propHeight => screen.proportionateHeight(toDouble());

  /// proportionate width of the screen according the width of the Design (Figma)
  double get propWidth => screen.proportionateWidth(toDouble());

  /// Required percentage of height with limitation
  double hPConstraint({double? min, double? max}) =>
      screen.heightPercentageWithConstraints(toDouble(), min: min, max: max);

  /// Required percentage of width with limitation
  double wPConstraint({double? min, double? max}) =>
      screen.widthPercentageWithConstraints(toDouble(), min: min, max: max);

  /// proportionate height with limitation
  double pHConstraint({double? min, double? max}) =>
      screen.proportionateHeightWithConstraints(toDouble(), min: min, max: max);

  /// proportionate width with limitation
  double pWConstraint({double? min, double? max}) =>
      screen.proportionateWidthWithConstraints(toDouble(), min: min, max: max);
}
