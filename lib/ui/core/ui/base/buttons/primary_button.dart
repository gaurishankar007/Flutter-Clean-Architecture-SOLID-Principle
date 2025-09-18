import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../utils/ui_helpers.dart';
import '../loading_circle.dart';
import '../text/base_text.dart';

class PrimaryButton extends HookWidget {
  final Function() onTap;
  final String text;
  final TextType? textType;
  final FontWeight? textFontWeight;
  final Color? foregroundColor;
  final double? height;
  final double? width;
  final bool loadableButton;
  final Color? color;
  final double? elevation;
  final bool expandWidth;

  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
    this.textType,
    this.textFontWeight,
    this.foregroundColor = AppColors.white,
    this.height,
    this.width,
    this.color,
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
          return ElevatedButton(
            onPressed: onPressed.call,
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: UIHelpers.xSmallCRadius,
              ),
              elevation: elevation,
            ),
            child: loading
                ? LoadingCircle.small(foregroundColor)
                : BaseText(
                    text,
                    color: foregroundColor,
                    textType: textType ?? TextType.bodyLarge,
                    fontWeight: textFontWeight ?? FontWeight.w500,
                  ),
          );
        },
      ),
    );
  }
}
