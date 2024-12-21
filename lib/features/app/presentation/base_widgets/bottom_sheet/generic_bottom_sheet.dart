import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_icon.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../../../core/utils/screen_util/screen_util.dart';
import '../../../../../core/utils/ui_helper.dart';
import '../../widgets/title_widget.dart';
import '../action/icon_button_widget.dart';
import '../action/primary_button_widget.dart';
import '../action/secondary_button_widget.dart';

part 'bottom_sheet_button_widget.dart';
part 'bottom_sheet_container_widget.dart';
part 'bottom_sheet_title_widget.dart';

Future<T?> showGenericBottomSheet<T>(
  BuildContext context, {
  required Widget child,
}) async {
  return await showModalBottomSheet<T>(
    context: context,
    backgroundColor: AppColor.white,
    barrierColor: AppColor.black60,
    useSafeArea: true,
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: false,
    scrollControlDisabledMaxHeightRatio: .95,
    shape: RoundedRectangleBorder(
      borderRadius: UIHelper.largeTRadius,
    ),
    builder: (builder) => ClipRRect(
      borderRadius: UIHelper.largeTRadius,
      child: child,
    ),
  );
}
