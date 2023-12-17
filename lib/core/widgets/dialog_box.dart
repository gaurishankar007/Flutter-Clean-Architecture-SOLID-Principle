import 'package:flutter/material.dart';

import '../../injection/injector.dart';
import '../constants/colors.dart';
import '../utils/text_styles.dart';
import 'button.dart';
import 'image_builder.dart';

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
      return AlertDialog.adaptive(
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
            expandWidth: true,
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
