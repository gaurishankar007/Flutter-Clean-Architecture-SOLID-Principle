import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../../../core/utils/screen_util/screen_util.dart';
import '../../../../../core/utils/ui_helpers.dart';
import '../../widgets/title_widget.dart';
import '../action/icon_button_widget.dart';
import '../action/primary_button_widget.dart';
import '../action/secondary_button_widget.dart';

part 'bottom_sheet_button_widget.dart';
part 'bottom_sheet_container_widget.dart';
part 'bottom_sheet_title_widget.dart';

Future<T?> showGenericBottomSheet<T>({
  BuildContext? context,
  Widget? child,
}) async {
  context ??= NavigationUtil.I.navigatorKey.currentContext;
  if (context == null) return null;

  return await showModalBottomSheet<T>(
    context: context,
    backgroundColor: AppColors.white,
    barrierColor: AppColors.black60,
    useSafeArea: true,
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: false,
    scrollControlDisabledMaxHeightRatio: .95,
    shape: RoundedRectangleBorder(
      borderRadius: UIHelpers.largeTRadius,
    ),
    builder: (builder) => ClipRRect(
      borderRadius: UIHelpers.largeTRadius,
      child: child,
    ),
  );
}
