import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

part 'screen_type.dart';

/// Provides screen size measurements
class ScreenUtil {
  ScreenUtil._();
  static final ScreenUtil _singleton = ScreenUtil._();

  /// Returns an object of [ScreenUtil] which is always the same
  factory ScreenUtil() => _singleton;

  /// Returns an object of [ScreenUtil] which is always the same
  static ScreenUtil get I => ScreenUtil();

  double _width = 0;
  double _height = 0;
  double _statusBarHeight = 0;
  bool isTablet = false;
  ScreenType _screenType = ScreenType.medium;

  double get height => _height;
  double get width => _width;

  /// Height of the system top status bar
  double get statusBarHeight => _statusBarHeight;

  /// Screen type according to the width
  ///* small, medium, large, extraLarge
  ScreenType get screenType => _screenType;

  /// Set screen dimensions, orientation, screen type, etc.
  configureScreen(Size size) {
    _height = size.height;
    _width = size.width;
    _statusBarHeight = 0;

    _isTablet();
    _checkScreenType();

    /// Setting orientation for the device
    final orientation = isTablet
        ? DeviceOrientation.landscapeLeft
        : DeviceOrientation.portraitUp;
    SystemChrome.setPreferredOrientations([orientation]);
  }

  /// Check whether the device is tablet or smartphone
  _isTablet() {
    final flutterView = WidgetsBinding.instance.platformDispatcher.views.first;

    /// Checking if device is smartphone or tablet
    double shortestSide =
        flutterView.physicalSize.shortestSide / flutterView.devicePixelRatio;
    isTablet = shortestSide > 600;
  }

  /// Check screen size according to the width
  _checkScreenType() {
    if (_width <= 360) {
      _screenType = ScreenType.small;
    } else if (_width > 360 && _width <= 540) {
      _screenType = ScreenType.medium;
    } else if (_width > 540 && _width <= 720) {
      _screenType = ScreenType.large;
    } else {
      _screenType = ScreenType.extraLarge;
    }
  }

  /// Get the required number within the limitation
  double _limitedNumber(double number, {double? min, double? max}) {
    if (min != null && number < min) return min;
    if (max != null && number > max) return max;
    return number;
  }

  /// Required percentage of height with limitation
  double heightPercentage(double percentage, {double? min, double? max}) {
    double height = percentage / 100 * _height;
    if (min == null && max == null) return height;

    return _limitedNumber(height, min: min, max: max);
  }

  /// Required percentage of width with limitation
  double widthPercentage(double percentage, {double? min, double? max}) {
    double width = percentage / 100 * _width;
    if (min == null && max == null) return width;

    return _limitedNumber(width, min: min, max: max);
  }

  /// Get the adaptive number size according to the screen type with the lower and upper bound
  /// * [baseScreen] is the screen type that the text size is designed for
  double adaptiveNumBound({
    required ScreenType baseScreen,
    required double baseSize,
    double? lowerBound,
    double? upperBound,
  }) {
    if (_screenType == baseScreen) return baseSize;
    if (lowerBound == null && upperBound == null) return baseSize;

    // If the screen type is smaller than the base screen type
    if (_screenType.index < baseScreen.index) return lowerBound ?? baseSize;

    return upperBound ?? baseSize;
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

  /// Button, TextField, DropdownButton adaptive height according to the screen type
  double get actionHeight => 50;

  /// Navigation Bar height
  double get bottomNavigationHeight => 50;

  /// Page horizontal padding in smartphones
  double get horizontalPadding {
    if (screenType != ScreenType.small) return widthPercentage(5.55, max: 20);
    return 12;
  }

  /// Page padding
  EdgeInsets pagePadding({double? topPadding, double? bottomPadding}) =>
      EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        top: topPadding ?? 8,
        bottom: bottomPadding ?? 12,
      );
}
