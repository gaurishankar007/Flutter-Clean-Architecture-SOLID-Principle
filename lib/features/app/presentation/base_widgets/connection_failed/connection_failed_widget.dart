import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/utils/extensions/num_extension.dart';
import '../../../../../core/utils/ui_helper.dart';
import '../action/primary_button_widget.dart';
import '../text/text_widget.dart';
import 'network_tower_widget.dart';

class ConnectionFailedWidget extends StatelessWidget {
  final Function() callBack;
  const ConnectionFailedWidget({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: UIHelper.smallTLargeBPadding,
            child: const NetworkTowerWidget(),
          ),
          Text(
            "Whoops!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36.bounded(lower: 28),
              fontWeight: FontWeight.w600,
            ),
          ),
          TextWidget.title(
            "Connection Failure 🛰️",
            textAlign: TextAlign.center,
            color: AppColor.black,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          PrimaryButtonWidget(
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
