import 'package:flutter/material.dart';

import '../core/extensions/int_extension.dart';
import '../core/utils/text_styles.dart';

class CustomTextForm extends StatelessWidget {
  final Key? textFormKey;
  final TextEditingController? controller;
  final String? title;
  final TextStyle? titleStyle;
  final double? height;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String?)? onChanged;
  final String? initialValue;
  final InputDecoration? inputDecoration;

  const CustomTextForm({
    super.key,
    this.textFormKey,
    this.controller,
    this.title,
    this.titleStyle,
    this.height,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.initialValue,
    this.inputDecoration,
  });

  @override
  Widget build(BuildContext context) {
    double newHeight = height ?? 60.pHConstraint(max: 60, min: 50);

    Widget child = SizedBox(
      height: newHeight,
      child: TextFormField(
        key: textFormKey,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        initialValue: initialValue,
        obscureText: obscureText,
        decoration: inputDecoration,
      ),
    );

    if (title == null) return child;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title!, style: titleStyle ?? xLargeSemibold()),
        SizedBox(height: 15.propHeight),
        child,
      ],
    );
  }
}
