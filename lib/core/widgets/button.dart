import 'package:flutter/material.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/core/utils/text_styles.dart';
import 'package:boilerplate/injection/injector.dart';

class CusButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final double? height;
  final double? width;
  final bool outlined;
  final bool disabled;
  final bool loading;
  final Future Function() onTap;
  final TextStyle? textStyle;
  final Color? color;
  final Color? borderColor;
  final double? elevation;
  final bool expandWidth;

  const CusButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.textStyle,
    this.color,
    this.outlined = false,
    this.disabled = false,
    this.loading = false,
    this.icon,
    this.borderColor,
    this.elevation,
    this.expandWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    bool load = false;
    Color tColor = kWhite;
    BorderSide borderSide = BorderSide.none;

    if (outlined) {
      tColor = color ?? kP;
      borderSide = BorderSide(color: borderColor ?? color ?? kP, width: 2);
    }

    Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          Container(margin: EdgeInsets.only(right: size.pSW(10)), child: icon!),
        Text(text, style: textStyle ?? xlSemibold(tColor)),
      ],
    );

    Widget loadingChild = Center(
      child: SizedBox(
        height: size.pSH(30),
        width: size.pSH(30),
        child: CircularProgressIndicator(
          color: outlined ? color : kWhite,
          strokeWidth: 2,
        ),
      ),
    );

    return SizedBox(
      height: height ?? size.pSH(70),
      width: expandWidth ? width ?? double.maxFinite : null,
      child: StatefulBuilder(builder: (context, setState) {
        return ElevatedButton(
          onPressed: load
              ? () {}
              : () async {
                  if (loading) setState(() => load = true);
                  await onTap();
                  if (loading) setState(() => load = false);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: outlined ? kWhite : color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.pSW(6)),
              side: borderSide,
            ),
            elevation: elevation,
          ),
          child: load ? loadingChild : child,
        );
      }),
    );
  }
}
