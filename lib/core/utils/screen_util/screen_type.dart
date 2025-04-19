part of 'screen_util.dart';

/// Device screen type according to the screen width
///* [unknown] -> screen type is not set upped
///* [small] -> width <= 360
///* [medium] -> 360 < width <= 540
///* [large] -> 540 < width <= 720
///* [extraLarge] -> 720 < width
enum ScreenType {
  unknown,
  small,
  medium,
  large,
  extraLarge;
}
