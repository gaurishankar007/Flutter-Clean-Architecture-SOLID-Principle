import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/utils/ui_helper.dart';
import '../../../../../app/presentation/base_widgets/action/primary_button_widget.dart';

showCloseAppDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        backgroundColor: AppColor.white,
        title: const Text("CleanArchitecture App"),
        content: const Text("Are you sure you want to close the app?"),
        actionsPadding: UIHelper.sMediumAllPadding,
        actions: [
          PrimaryButtonWidget(
            height: 40,
            width: 80,
            onTap: () => Navigator.pop(dialogContext),
            text: "No",
            foregroundColor: AppColor.white,
          ),
          UIHelper.xxSmallHSpace,
          PrimaryButtonWidget(
            height: 40,
            width: 80,
            color: AppColor.red600,
            onTap: () {
              Navigator.pop(dialogContext);
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
            text: "Yes",
            foregroundColor: AppColor.white,
          ),
        ],
      );
    },
  );
}
