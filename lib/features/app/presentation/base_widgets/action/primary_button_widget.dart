import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/utils/screen_util/screen_util.dart';
import '../../../../../core/utils/ui_helper.dart';
import '../loading_circle_widget.dart';
import '../text/text_widget.dart';

class PrimaryButtonWidget extends HookWidget {
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

  const PrimaryButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.textType,
    this.textFontWeight,
    this.foregroundColor = AppColor.white,
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
      height: height ?? ScreenUtil.I.actionHeight,
      width: expandWidth ? double.maxFinite : width,
      child: ValueListenableBuilder(
        valueListenable: loadingNotifier,
        builder: (builderContext, loading, setState) {
          return ElevatedButton(
            onPressed: onPressed.call,
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: UIHelper.xSmallCRadius,
              ),
              elevation: elevation,
            ),
            child: loading
                ? LoadingCircleWidget.small(foregroundColor)
                : TextWidget(
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
