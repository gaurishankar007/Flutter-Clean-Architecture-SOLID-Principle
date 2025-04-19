import 'package:flutter/material.dart';

import 'screen_util/screen_util.dart';

enum Space {
  xxxSmall(2),
  xxSmall(4),
  xSmall(8),
  small(12),
  sMedium(16),
  medium(20),
  large(24),
  xLarge(32),
  xxLarge(40),
  xxxLarge(48),
  massive(64);

  const Space(this.value);
  final double value;
}

class UIHelper {
  UIHelper._();

  /// Shows nothing in the UI
  static const nothing = SizedBox.shrink();

  /// Get Zero padding
  static const zeroPadding = EdgeInsets.zero;

  //<========== Horizontal Spacing ==========>
  /// Horizontal Space = 2
  static final xxxSmallHSpace = SizedBox(width: Space.xxxSmall.value);

  /// Horizontal Space = 4
  static final xxSmallHSpace = SizedBox(width: Space.xxSmall.value);

  /// Horizontal Space = 8
  static final xSmallHSpace = SizedBox(width: Space.xSmall.value);

  /// Horizontal Space = 12
  static final smallHSpace = SizedBox(width: Space.small.value);

  /// Horizontal Space = 20
  static final mediumHSpace = SizedBox(width: Space.medium.value);

  /// Horizontal Space = max finite
  static const maxFiniteHSpace = SizedBox(width: double.maxFinite);

  /// Horizontal Space = screen padding
  static final screenHSpace = SizedBox(width: ScreenUtil.I.horizontalSpace);

  //<========== Vertical Spacing ==========>
  /// Vertical Space = 4
  static final xxSmallVSpace = SizedBox(height: Space.xxSmall.value);

  /// Vertical Space = 8
  static final xSmallVSpace = SizedBox(height: Space.xSmall.value);

  /// Vertical Space = 12
  static final smallVSpace = SizedBox(height: Space.small.value);

  /// Vertical Space = 16
  static final sMediumVSpace = SizedBox(height: Space.sMedium.value);

  /// Vertical Space = 20
  static final mediumVSpace = SizedBox(height: Space.medium.value);

  /// Vertical Space = 24
  static final largeVSpace = SizedBox(height: Space.large.value);

  //<========== All Padding ==========>
  /// All Padding = 4
  static final xxSmallAllPadding = EdgeInsets.all(Space.xxSmall.value);

  /// All Padding = 8
  static final xSmallAllPadding = EdgeInsets.all(Space.xSmall.value);

  /// All Padding = 12
  static final smallAllPadding = EdgeInsets.all(Space.small.value);

  /// All Padding = 16
  static final sMediumAllPadding = EdgeInsets.all(Space.sMedium.value);

  /// All Padding = 20
  static final mediumAllPadding = EdgeInsets.all(Space.medium.value);

  /// All Padding = screen padding
  static final screenAllPadding =
      EdgeInsets.all(ScreenUtil.I.horizontalSpace);

  //<========== Horizontal Padding ==========>
  /// Horizontal Padding = 12
  static final smallHPadding =
      EdgeInsets.symmetric(horizontal: Space.small.value);

  /// Horizontal Padding = 16
  static final sMediumHPadding =
      EdgeInsets.symmetric(horizontal: Space.sMedium.value);

  /// Horizontal Padding = screen horizontal padding
  static final screenHPadding =
      EdgeInsets.symmetric(horizontal: ScreenUtil.I.horizontalSpace);

  //<========== Vertical Padding ==========>
  /// Vertical Padding = 4
  static final xxSmallVPadding =
      EdgeInsets.symmetric(vertical: Space.xxSmall.value);

  /// Vertical Padding = 8
  static final xSmallVPadding =
      EdgeInsets.symmetric(vertical: Space.xSmall.value);

  /// Vertical Padding = 12
  static final smallVPadding =
      EdgeInsets.symmetric(vertical: Space.small.value);

  /// Vertical Padding = 16
  static final sMediumVPadding =
      EdgeInsets.symmetric(vertical: Space.sMedium.value);

  /// Vertical Padding = 20
  static final mediumVPadding =
      EdgeInsets.symmetric(vertical: Space.medium.value);

  /// Vertical Padding = 24
  static final largeVPadding =
      EdgeInsets.symmetric(vertical: Space.large.value);

  //<========== Symmetric Padding ==========>
  /// Symmetric Padding = 8 horizontal, 4 vertical
  static final xSmallHxxSmallVPadding = EdgeInsets.symmetric(
    horizontal: Space.xSmall.value,
    vertical: Space.xxSmall.value,
  );

  /// Symmetric Padding = 8 horizontal, 12 vertical
  static final xSmallHSmallVPadding = EdgeInsets.symmetric(
    horizontal: Space.xSmall.value,
    vertical: Space.small.value,
  );

  /// Symmetric Padding = 12 horizontal, 8 vertical
  static final smallHxSmallVPadding = EdgeInsets.symmetric(
    horizontal: Space.small.value,
    vertical: Space.xSmall.value,
  );

  /// Symmetric Padding = 12 horizontal, 16 vertical
  static final smallHsMediumVPadding = EdgeInsets.symmetric(
    horizontal: Space.small.value,
    vertical: Space.sMedium.value,
  );

  /// Symmetric Padding = 16 horizontal, 8 vertical
  static final sMediumHxSmallVPadding = EdgeInsets.symmetric(
    horizontal: Space.sMedium.value,
    vertical: Space.xSmall.value,
  );

  /// Symmetric Padding = screen horizontal padding, 16 vertical
  static final screenHsMediumVPadding = EdgeInsets.symmetric(
    horizontal: ScreenUtil.I.horizontalSpace,
    vertical: Space.sMedium.value,
  );

  //<========== Left Padding ==========>
  /// Left Padding = 8
  static final xSmallLPadding = EdgeInsets.only(left: Space.xSmall.value);

  /// Left Padding = screen horizontal padding
  static final screenLPadding = EdgeInsets.only(
    left: ScreenUtil.I.horizontalSpace,
  );

  //<========== Top Padding ==========>
  /// Top Padding = 8
  static final xSmallTPadding = EdgeInsets.only(top: Space.xSmall.value);

  /// Top Padding = 12
  static final smallTPadding = EdgeInsets.only(top: Space.small.value);

  //<========== Right Padding ==========>
  /// Right Padding = 24
  static final largeRPadding = EdgeInsets.only(right: Space.large.value);

  /// Right Padding = screen horizontal Padding
  static final screenRPadding = EdgeInsets.only(
    right: ScreenUtil.I.horizontalSpace,
  );

  //<========== Top Bottom Padding ==========>
  /// Top Bottom Padding = 4 Top, 32 bottom
  static final xxSmallTxLargeBPadding = EdgeInsets.only(
    top: Space.xxSmall.value,
    bottom: Space.xLarge.value,
  );

  /// Top Bottom Padding = 8 Top, 2 bottom
  static final xSmallTxxxSmallBPadding = EdgeInsets.only(
    top: Space.xSmall.value,
    bottom: Space.xxxSmall.value,
  );

  /// Top Bottom Padding = 8 Top, 4 bottom
  static final xSmallTxxSmallBPadding = EdgeInsets.only(
    top: Space.xSmall.value,
    bottom: Space.xxSmall.value,
  );

  /// Top Bottom Padding = 8 Top, 12 bottom
  static final xSmallTSmallBPadding = EdgeInsets.only(
    top: Space.xSmall.value,
    bottom: Space.small.value,
  );

  /// Top Bottom Padding = 8 Top, 16 bottom
  static final xSmallTsMediumBPadding = EdgeInsets.only(
    top: Space.xSmall.value,
    bottom: Space.sMedium.value,
  );

  /// Top Bottom Padding = 12 Top, 4 bottom
  static final smallTxxSmallBPadding = EdgeInsets.only(
    top: Space.small.value,
    bottom: Space.xxSmall.value,
  );

  /// Top Bottom Padding = 12 Top, 20 bottom
  static final smallTMediumBPadding = EdgeInsets.only(
    top: Space.small.value,
    bottom: Space.medium.value,
  );

  /// Top Bottom Padding = 12 Top, 24 bottom
  static final smallTLargeBPadding = EdgeInsets.only(
    top: Space.small.value,
    bottom: Space.large.value,
  );

  /// Top Bottom Padding = 12 Top, 40 bottom
  static final smallTxxLargeBPadding = EdgeInsets.only(
    top: Space.small.value,
    bottom: Space.xxLarge.value,
  );

  /// Top Bottom Padding = 12 Top, 64 bottom
  static final smallTMassiveBPadding = EdgeInsets.only(
    top: Space.small.value,
    bottom: Space.massive.value,
  );

  /// Top Bottom Padding = 16 Top, 8 bottom
  static final sMediumTxSmallBPadding = EdgeInsets.only(
    top: Space.sMedium.value,
    bottom: Space.xSmall.value,
  );

  /// Top Bottom Padding = 16 Top, 12 bottom
  static final sMediumTSmallBPadding = EdgeInsets.only(
    top: Space.sMedium.value,
    bottom: Space.small.value,
  );

  /// Top Bottom Padding = 20 Top, 4 bottom
  static final mediumTxxSmallBPadding = EdgeInsets.only(
    top: Space.medium.value,
    bottom: Space.xxSmall.value,
  );

  /// Top Bottom Padding = 20 Top, 8 bottom
  static final mediumTxSmallBPadding = EdgeInsets.only(
    top: Space.medium.value,
    bottom: Space.xSmall.value,
  );

  /// Top Bottom Padding = 24 Top, 12 bottom
  static final largeTSmallBPadding = EdgeInsets.only(
    top: Space.large.value,
    bottom: Space.small.value,
  );

  //<========== Only Padding ==========>
  /// Only padding = left, right = screen horizontal padding, top, bottom = 16
  static screenLR({double? top, double? bottom}) => EdgeInsets.only(
        top: top ?? Space.sMedium.value,
        right: ScreenUtil.I.horizontalSpace,
        bottom: bottom ?? Space.sMedium.value,
        left: ScreenUtil.I.horizontalSpace,
      );

  //<========== Border Radius ==========>
  /// Border Radius = 4 Circular
  static final xxSmallCRadius = BorderRadius.circular(Space.xxSmall.value);

  /// Border Radius = 8 Circular
  static final xSmallCRadius = BorderRadius.circular(Space.xSmall.value);

  /// Border Radius = 12 Circular
  static final smallCRadius = BorderRadius.circular(Space.small.value);

  /// Border Radius = 16 Circular
  static final sMediumCRadius = BorderRadius.circular(Space.sMedium.value);

  /// Border Radius = 24 Circular
  static final largeCRadius = BorderRadius.circular(Space.large.value);

  /// Border Radius = 16 Top
  static final sMediumTRadius = BorderRadius.only(
    topLeft: Radius.circular(Space.sMedium.value),
    topRight: Radius.circular(Space.sMedium.value),
  );

  /// Border Radius = 24 Top
  static final largeTRadius = BorderRadius.only(
    topLeft: Radius.circular(Space.large.value),
    topRight: Radius.circular(Space.large.value),
  );

  /// Border Radius = 24 Bottom
  static final largeBRadius = BorderRadius.only(
    bottomLeft: Radius.circular(Space.large.value),
    bottomRight: Radius.circular(Space.large.value),
  );
}
