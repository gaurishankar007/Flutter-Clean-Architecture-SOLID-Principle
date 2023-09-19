import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }
  }

  // Get the proportionate height as per screen size
  double pSH(double inputHeight) => (inputHeight / 949.0) * _screenHeight;
// Get the proportionate height as per screen size
  double pSW(double inputWidth) => (inputWidth / 430.0) * _screenWidth;

  Size get sSize => Size(_screenWidth, _screenHeight);
  double get height => _screenHeight;
  double get width => _screenWidth;
}
