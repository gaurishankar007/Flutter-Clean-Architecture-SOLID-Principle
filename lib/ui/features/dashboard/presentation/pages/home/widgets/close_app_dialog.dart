import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/ui_helpers.dart';
import '../../../../../../core/ui/base/buttons/primary_button.dart';

void showCloseAppDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        title: const Text("CleanArchitecture App"),
        content: const Text("Are you sure you want to close the app?"),
        actionsPadding: UIHelpers.sMediumAllPadding,
        actions: [
          PrimaryButton(
            height: 40,
            width: 80,
            onTap: () => Navigator.pop(dialogContext),
            text: "No",
            foregroundColor: AppColors.white,
          ),
          UIHelpers.xxSmallHSpace,
          PrimaryButton(
            height: 40,
            width: 80,
            color: AppColors.red600,
            onTap: () {
              Navigator.pop(dialogContext);
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
            text: "Yes",
            foregroundColor: AppColors.white,
          ),
        ],
      );
    },
  );
}
