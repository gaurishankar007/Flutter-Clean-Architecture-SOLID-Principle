import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A class that stores screen height, width, screen paddings, and dynamic sizes
class ScreenSize {
  double _height = 0;
  double _width = 0;
  double _statusBarHeight = 0;
  bool _isTablet = false;

  ScreenSize._();
  static final _singleton = ScreenSize._();
  factory ScreenSize() => _singleton;

  double get height => _height;
  double get width => _width;
  double get statusBarHeight => _statusBarHeight;

  initializeScreen(BoxConstraints constraints, BuildContext context) {
    _height = constraints.maxHeight;
    _width = constraints.maxWidth;

    /// Height of the system top status bar
    _statusBarHeight = MediaQuery.of(context).padding.top;

    checkDeviceType();
  }

  /// Check whether the device is tablet or smartphone
  checkDeviceType() {
    final flutterView = WidgetsBinding.instance.platformDispatcher.views.first;

    /// Checking if device is smartphone or tablet
    double shortestSide = flutterView.physicalSize.shortestSide / flutterView.devicePixelRatio;
    _isTablet = shortestSide > 600;

    /// Setting orientation for the device
    final orientation = _isTablet ? DeviceOrientation.landscapeLeft : DeviceOrientation.portraitUp;
    SystemChrome.setPreferredOrientations([orientation]);
  }

  /// Required percentage of height according the screen height
  double heightPercentage(double percentage) => percentage / 100 * _height;

  /// Required percentage of width according the screen width
  double widthPercentage(double percentage) => percentage / 100 * _width;

  /// proportionate height of the screen according the height of the Design (Figma)
  double proportionateHeight(double height) => (height / 949) * _height;

  /// proportionate width of the screen according the width of the Design (Figma)
  double proportionateWidth(double width) => (width / 430) * _width;

  /// Get the required number within the limitation
  double _numberWithinLimitation(double number, {double? min, double? max}) {
    if (min != null && number < min) return min;
    if (max != null && number > max) return max;
    return number;
  }

  /// Required percentage of height with limitation
  double heightPercentageWithConstraints(double percentage, {double? min, double? max}) {
    double height = percentage / 100 * _height;
    return _numberWithinLimitation(height, min: min, max: max);
  }

  /// Required percentage of width with limitation
  double widthPercentageWithConstraints(double percentage, {double? min, double? max}) {
    double width = percentage / 100 * _width;
    return _numberWithinLimitation(width, min: min, max: max);
  }

  /// proportionate height with limitation
  double proportionateHeightWithConstraints(double height, {double? min, double? max}) {
    double newHeight = proportionateHeight(height);
    return _numberWithinLimitation(newHeight, min: min, max: max);
  }

  /// proportionate width with limitation
  double proportionateWidthWithConstraints(double width, {double? min, double? max}) {
    double newWidth = proportionateWidth(width);
    return _numberWithinLimitation(newWidth, min: min, max: max);
  }

  /// Page horizontal padding in smartphones
  double get horizontalPadding => widthPercentageWithConstraints(5, max: 15);

  /// Page horizontal padding in tablet
  double get tabletHorizontalPadding => widthPercentage(17.5);

  /// Get the required horizontal padding according to the device type
  double get dynamicHorizontalPadding => _isTablet ? tabletHorizontalPadding : horizontalPadding;

  /// Get the required drawer width according to the device type
  double get dynamicDrawerWidth => _isTablet ? widthPercentage(50) : widthPercentage(90);
}
