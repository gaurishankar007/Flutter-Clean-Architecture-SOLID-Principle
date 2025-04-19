import 'package:flutter/widgets.dart';

part 'screen_type.dart';

/// Provides screen size measurements
class ScreenUtil {
  ScreenUtil._();
  static final ScreenUtil _singleton = ScreenUtil._();

  factory ScreenUtil() => _singleton;
  static ScreenUtil get I => ScreenUtil();

  double _width = 0;
  double _height = 0;
  ScreenType _screenType = ScreenType.unknown;
  double _statusBarHeight = 0;
  double _devicePixelRatio = 0;

  double get height => _height;
  double get width => _width;

  /// Screen type according to the width
  ///* small, medium, large, extraLarge
  ScreenType get screenType => _screenType;

  /// Height of the system top status bar
  double get statusBarHeight => _statusBarHeight;

  /// Physical pixels on the screen ↔️ Logical (Flutter) pixels you work with.
  ///
  /// 🔍 Example:
  ///
  /// Let’s say you're working on a phone with:
  /// - A screen resolution of 1080 × 1920 (physical pixels)
  /// - And the screen size in Flutter is 360 × 640 logical pixels
  /// - Then the devicePixelRatio = 1080 / 360 = 3.0
  double get devicePixelRatio => _devicePixelRatio;

  /// Set screen dimensions, orientation, screen type, etc.
  configureScreen(Size size) {
    _height = size.height;
    _width = size.width;
    _statusBarHeight = 0;
    _devicePixelRatio =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    _screenType = _checkScreenType();
  }

  /// Check screen size according to the width
  ScreenType _checkScreenType() {
    if (width <= 360) return ScreenType.small;
    if (width <= 540) return ScreenType.medium;
    if (width <= 720) return ScreenType.large;
    return ScreenType.extraLarge;
  }

  /// Get the required number within the limitation
  double _limitedNumber(double number, {double? min, double? max}) {
    if (min != null && number < min) return min;
    if (max != null && number > max) return max;
    return number;
  }

  /// Required percentage of height with limitation
  double heightPart(double percentage, {double? min, double? max}) {
    double height = percentage / 100 * _height;
    if (min == null && max == null) return height;

    return _limitedNumber(height, min: min, max: max);
  }

  /// Required percentage of width with limitation
  double widthPart(double percentage, {double? min, double? max}) {
    double width = percentage / 100 * _width;
    if (min == null && max == null) return width;

    return _limitedNumber(width, min: min, max: max);
  }

  /// Get the adaptive value based on the screen type with the lower and upper bound
  /// * [baseScreen] is the screen type that the text size is designed for
  T adaptiveBound<T>({
    ScreenType baseScreen = ScreenType.large,
    required T baseValue,
    T? lowerBound,
    T? upperBound,
  }) {
    if (_screenType == baseScreen) return baseValue;
    // If the screen type is smaller than the base screen type
    if (_screenType.index < baseScreen.index) return lowerBound ?? baseValue;
    return upperBound ?? baseValue;
  }

  /// Get the adaptive number according to the screen type
  /// * [baseScreen] is the screen type that is designed for
  /// * [baseValue] is the value that is designed for the base screen type
  /// * [differenceBy] is the difference value that will be added or subtracted according to the screen type
  /// * [maxDifferenceCount] is the maximum difference count that will be added or subtracted
  double adaptiveNumber({
    required ScreenType baseScreen,
    required double baseValue,
    required double differenceBy,
    int? maxDifferenceCount,
  }) {
    if (_screenType == baseScreen) return baseValue;

    // Difference between the screen types
    int indexDifference = (_screenType.index - baseScreen.index).abs();

    // If the difference is greater than the max difference count
    if (maxDifferenceCount != null && indexDifference > maxDifferenceCount) {
      indexDifference = maxDifferenceCount;
    }

    // Difference value
    double differenceValue = differenceBy * indexDifference;

    // If the screen type is greater than the base screen type
    if (_screenType.index > baseScreen.index) {
      return baseValue + differenceValue;
    }

    // If the screen type is smaller than the base screen type
    if (baseValue < differenceValue) return baseValue;
    return baseValue - differenceValue;
  }

  /// Page horizontal padding
  double get horizontalSpace {
    /// If the screen is small or medium size
    if (_width < 540) return widthPart(5.55, max: 20);
    return 24;
  }

  /// Page vertical padding
  double get verticalSpace => _width < 540 ? 24 : 32;

  /// View horizontal padding
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: horizontalSpace);

  /// View padding
  EdgeInsets pagePadding() => EdgeInsets.symmetric(
        horizontal: horizontalSpace,
        vertical: verticalSpace,
      );

  /// Width of the screen excluding left and right screen padding
  double availableWidth({double extraSpace = 0}) =>
      width - (horizontalSpace * 2) - extraSpace;
}
