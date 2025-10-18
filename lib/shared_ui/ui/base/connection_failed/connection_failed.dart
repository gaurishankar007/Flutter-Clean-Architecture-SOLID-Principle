import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../utils/ui_helpers.dart';
import '../buttons/primary_button.dart';
import '../text/base_text.dart';
import 'network_tower.dart';

class ConnectionFailed extends StatelessWidget {
  final Function() callBack;
  const ConnectionFailed({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: UIHelpers.smallTLargeBPadding,
            child: const NetworkTower(),
          ),
          Text(
            "Whoops!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
          BaseText.title(
            "Connection Failure 🛰️",
            textAlign: TextAlign.center,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          PrimaryButton(
            expandWidth: true,
            onTap: callBack,
            color: Colors.indigo,
            text: "Try Again",
          ),
        ],
      ),
    );
  }
}
