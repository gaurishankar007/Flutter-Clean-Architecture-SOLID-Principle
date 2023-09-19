import 'package:flutter/material.dart';
import 'package:boilerplate/core/utils/text_styles.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/core/widgets/button.dart';
import 'package:boilerplate/core/widgets/image_builder.dart';
import 'package:boilerplate/injection/injector.dart';

buttonDialog({
  required BuildContext context,
  required String title,
  required String buttonText,
  required Color buttonColor,
  required Function() buttonOnTap,
  Widget? content,
}) {
  return showDialog(
    context: context,
    builder: (builder) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.pSH(16)),
        ),
        titlePadding: EdgeInsets.all(size.pSW(45)),
        title: Text(title, textAlign: TextAlign.center),
        titleTextStyle: xxlRegular(kBlack),
        content: content,
        actionsPadding: EdgeInsets.only(
          left: size.pSW(45),
          right: size.pSW(45),
          bottom: size.pSW(45),
        ),
        actions: [
          CusButton(
            onTap: () async {
              Navigator.pop(builder);
              buttonOnTap();
            },
            text: buttonText,
            color: buttonColor,
          )
        ],
      );
    },
  );
}

imageDialog({required BuildContext context, required String url}) {
  showDialog(
    context: context,
    builder: (builder) => AlertDialog(content: ImageBuilder(imageUrl: url)),
  );
}
