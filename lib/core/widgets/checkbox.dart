import 'package:flutter/material.dart';

import '../../injection/injector.dart';
import '../constants/colors.dart';
import '../extensions/build_context_extension.dart';

class CusCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;
  final String? title;
  final TextStyle? titleStyle;
  final double? scale;

  const CusCheckBox({
    super.key,
    required this.value,
    this.onChanged,
    this.title,
    this.titleStyle,
    this.scale = .85,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: scale,
          child: Checkbox(
            value: value,
            fillColor: MaterialStateColor.resolveWith(
              (states) => value ? context.cs.primary : k4C4,
            ),
            side: BorderSide.none,
            onChanged: onChanged,
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        if (title != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: size.pSW(5)),
              Text(title!, style: titleStyle)
            ],
          ),
      ],
    );
  }
}
