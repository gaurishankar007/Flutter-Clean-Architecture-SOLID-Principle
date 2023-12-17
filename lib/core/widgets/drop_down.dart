import 'package:flutter/material.dart';

import '../../injection/injector.dart';
import '../constants/colors.dart';
import '../extensions/build_context_extension.dart';
import '../utils/text_styles.dart';

class CusDropDown extends StatelessWidget {
  final String? title;
  final BoxBorder? border;
  final double? height;
  final String selectedValue;
  final List<DropDownValue> items;
  final Function(String?)? onChanged;

  const CusDropDown({
    super.key,
    this.title,
    this.height,
    this.border,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title!, style: smRegular(kB70)),
              SizedBox(height: size.pSH(15)),
            ],
          ),
        Container(
          width: double.maxFinite,
          height: height ?? size.pSH(70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.pSW(6)),
            border: border ?? Border.all(width: 2, color: context.cs.primary),
          ),
          alignment: Alignment.center,
          child: DropdownButton<String>(
            value: selectedValue,
            isExpanded: true,
            icon: Container(
              margin: EdgeInsets.only(right: size.pSW(20)),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: kB70,
              ),
            ),
            iconEnabledColor: kB50,
            iconSize: 25,
            underline: SizedBox(),
            onChanged: onChanged,
            dropdownColor: kWhite,
            borderRadius: BorderRadius.circular(size.pSW(6)),
            items: items.map<DropdownMenuItem<String>>((DropDownValue model) {
              return DropdownMenuItem<String>(
                value: model.value,
                child: Container(
                  margin: EdgeInsets.only(left: size.pSW(15)),
                  child: Text(model.text, style: lgRegular(kBlack)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class DropDownValue {
  final String value;
  final String text;

  const DropDownValue({
    required this.value,
    required this.text,
  });
}
