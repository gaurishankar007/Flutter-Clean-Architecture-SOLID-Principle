import '../screen_util/screen_util.dart';

extension NumberExtension<T extends num> on T {
  T get avoidNegativeValue => (this < 0 ? 0 : this) as T;

  /// Required percentage of height with limitation
  double heightPart({double? min, double? max}) =>
      ScreenUtil.I.heightPart(toDouble(), min: min, max: max);

  /// Required percentage of width with limitation
  double widthPart({double? min, double? max}) =>
      ScreenUtil.I.widthPart(toDouble(), min: min, max: max);
}
