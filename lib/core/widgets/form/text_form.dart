import 'package:flutter/material.dart';

import '../../../injection/injector.dart';
import '../../constants/colors.dart';
import '../../utils/text_styles.dart';

class CusTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final double? height;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String?)? onChanged;
  final String? initialValue;
  final Color? fillColor;
  final String hintText;
  final double hPad;
  final Widget? prefixIcon;
  final BoxConstraints? prefixBoxCon;
  final Function()? prefixOnTap;
  final Widget? suffixIcon;
  final BoxConstraints? suffixBoxCon;
  final Function()? suffixOnTap;

  const CusTextForm({
    super.key,
    this.controller,
    this.title,
    this.height,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.fillColor,
    this.initialValue,
    required this.hintText,
    this.hPad = 14,
    this.prefixIcon,
    this.prefixBoxCon,
    this.prefixOnTap,
    this.suffixIcon,
    this.suffixBoxCon,
    this.suffixOnTap,
  });

  @override
  Widget build(BuildContext context) {
    double newHeight = height ?? size.pSH(70);
    double leftPad = size.pSW(hPad);
    double rightPad = size.pSW(hPad);
    BoxConstraints? prefixBoxCon;
    Widget? prefix;
    Widget? suffix;

    if (prefixIcon != null) {
      leftPad = size.pSW(10);

      prefix = InkWell(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          bottomLeft: Radius.circular(6),
        ),
        onTap: prefixOnTap,
        child: Container(
          height: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: size.pSW(5)),
          child: prefixIcon,
        ),
      );
    }

    if (suffixIcon != null) {
      rightPad = size.pSW(15);

      suffix = InkWell(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
        onTap: suffixOnTap,
        child: Container(
          height: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: size.pSW(5)),
          child: suffixIcon,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title!, style: xlSemibold(kP1)),
              SizedBox(height: size.pSH(16)),
            ],
          ),
        SizedBox(
          height: newHeight,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            initialValue: initialValue,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: leftPad,
                right: rightPad,
              ),
              filled: fillColor != null,
              fillColor: fillColor,
              prefixIconConstraints: prefixBoxCon,
              prefixIcon: prefix,
              suffixIconConstraints: suffixBoxCon,
              suffixIcon: suffix,
              hintText: hintText,
              hintStyle: mdRegular(kE8E),
            ),
          ),
        ),
      ],
    );
  }
}
