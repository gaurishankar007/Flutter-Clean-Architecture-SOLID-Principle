import '../screen_util/screen_util.dart';

extension NumberExtension<T extends num> on T {
  /// Required percentage of height with limitation
  double heightPart({double? min, double? max}) =>
      ScreenUtil.I.heightPercentage(toDouble(), min: min, max: max);

  /// Required percentage of width with limitation
  double widthPart({double? min, double? max}) =>
      ScreenUtil.I.widthPercentage(toDouble(), min: min, max: max);

  /// Get the adaptive number according to the screen type with the lower and upper bound
  double bounded({
    ScreenType baseScreen = ScreenType.medium,
    double? lower,
    double? upper,
  }) =>
      ScreenUtil.I.adaptiveNumBound(
        baseScreen: baseScreen,
        baseSize: toDouble(),
        lowerBound: lower,
        upperBound: upper,
      );

  /// Get the adaptive number according to the screen type
  double adaptiveNum({
    ScreenType baseScreen = ScreenType.medium,
    required double differenceBy,
    int? maxDifferenceCount,
  }) =>
      ScreenUtil.I.adaptiveNumber(
        baseScreen: baseScreen,
        baseValue: toDouble(),
        differenceBy: differenceBy,
        maxDifferenceCount: maxDifferenceCount,
      );
}
