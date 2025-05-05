import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/ui_helpers.dart';
import '../loading_circle_widget.dart';
import '../text/text_widget.dart';

class SecondaryButtonWidget extends HookWidget {
  final Function() onTap;
  final String text;
  final TextType textType;
  final FontWeight textFontWeight;
  final Color? foregroundColor;
  final double? height;
  final double? width;
  final bool loadableButton;
  final Color color;
  final double? elevation;
  final bool expandWidth;

  const SecondaryButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.textType = TextType.bodyLarge,
    this.textFontWeight = FontWeight.w500,
    this.foregroundColor = AppColors.primary,
    this.height,
    this.width,
    this.color = AppColors.primary,
    this.loadableButton = false,
    this.elevation,
    this.expandWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final loadingNotifier = useValueNotifier(false);
    final onPressed = useCallback(() async {
      /// If the button is loading, discard the task
      if (loadingNotifier.value) return;

      /// If the button is not loadable
      if (!loadableButton) return onTap();

      loadingNotifier.value = true;
      await onTap();

      /// If the widget is disposed, don't update value
      if (!context.mounted) return;
      loadingNotifier.value = false;
    });

    return SizedBox(
      height: height ?? 50,
      width: expandWidth ? double.maxFinite : width,
      child: ValueListenableBuilder(
        valueListenable: loadingNotifier,
        builder: (builderContext, loading, setState) {
          return OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.white,
              side: BorderSide(color: color, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: UIHelpers.xSmallCRadius,
              ),
              elevation: 0,
              splashFactory: InkRipple.splashFactory,
            ),
            child: loading
                ? LoadingCircleWidget.small(foregroundColor)
                : TextWidget(
                    text,
                    color: foregroundColor,
                    textType: textType,
                    fontWeight: textFontWeight,
                  ),
          );
        },
      ),
    );
  }
}
