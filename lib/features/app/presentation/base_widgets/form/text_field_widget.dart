import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/ui_helpers.dart';
import '../text/text_widget.dart';

class TextFieldWidget extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final TextType? titleSize;
  final FontWeight? titleFontWeight;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final String? initialValue;
  final Function(String?)? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextFieldWidget({
    super.key,
    this.title,
    this.titleColor,
    this.titleSize,
    this.titleFontWeight,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.autovalidateMode,
    this.obscureText = false,
    this.focusNode,
    this.hintText = "",
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      readOnly: readOnly,
      autovalidateMode: autovalidateMode,
      obscureText: obscureText,
      obscuringCharacter: "*",
      style: const TextStyle(color: AppColors.base, fontSize: 16),
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: UIHelpers.sMediumAllPadding,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );

    if (title != null) {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
            title!,
            color: titleColor,
            textType: titleSize ?? TextType.titleSmall,
            fontWeight: FontWeight.w400,
          ),
          UIHelpers.xSmallVSpace,
          child,
        ],
      );
    }

    return child;
  }
}
