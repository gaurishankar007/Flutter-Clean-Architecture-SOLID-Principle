import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/utils/screen_util/screen_util.dart';
import '../../../../../core/utils/ui_helper.dart';
import '../text/text_widget.dart';

class DropDownValue<T> {
  final T value;
  final String text;

  const DropDownValue({
    required this.value,
    required this.text,
  });
}

class DropDownWidget<T> extends StatelessWidget {
  final T selectedValue;
  final List<DropDownValue> items;
  final Function(T?)? onChanged;

  const DropDownWidget({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.I.actionHeight,
      decoration: BoxDecoration(
        borderRadius: UIHelper.smallCRadius,
        border: Border.all(color: AppColor.border),
      ),
      alignment: Alignment.center,
      child: ButtonTheme(
        alignedDropdown: true,
        padding: UIHelper.sMediumHPadding,
        child: DropdownButton<T>(
          value: selectedValue,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColor.base,
          ),
          iconEnabledColor: AppColor.black60,
          iconSize: 25,
          underline: UIHelper.nothing,
          onChanged: onChanged,
          dropdownColor: AppColor.white,
          borderRadius: UIHelper.smallCRadius,
          items: items.map<DropdownMenuItem<T>>(
            (DropDownValue dropDownValue) {
              return DropdownMenuItem<T>(
                value: dropDownValue.value,
                child: TextWidget(
                  dropDownValue.text,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
