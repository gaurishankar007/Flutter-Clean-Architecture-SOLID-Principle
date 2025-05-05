import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../features/app/presentation/base_widgets/text/text_widget.dart';
import '../../constants/app_colors.dart';
import '../../data/states/data_state.dart';
import '../../utils/ui_helpers.dart';
import '../navigation/navigation_service.dart';

abstract class ToastMessageService {
  showSuccess(String message, {Duration? duration});
  showError(String message, {Duration? duration});
  showDataStateToast(DataState dataState, {String message = ""});
}

@LazySingleton(as: ToastMessageService)
class ToastMessageServiceImplementation implements ToastMessageService {
  final _toastSetting = const SlidingToastSetting(
    displayDuration: Duration(milliseconds: 2500),
    toastStartPosition: ToastPosition.top,
    toastAlignment: Alignment.topCenter,
  );
  final EdgeInsets _padding = UIHelpers.smallAllPadding;
  final BoxShadow _boxShadow = const BoxShadow(
    color: AppColors.black05,
    spreadRadius: 1,
    blurRadius: 3,
  );

  @override
  showSuccess(String message, {Duration? duration}) {
    InteractiveToast.slide(
      overlayState: NavigationUtil.I.navigatorKey.currentState?.overlay,
      title: Text(message),
      trailing: const Icon(
        Icons.check_circle_rounded,
        color: AppColors.green500,
        size: 20,
      ),
      toastSetting: _toastSetting.copyWith(displayDuration: duration),
      toastStyle: ToastStyle(
        padding: _padding,
        progressBarColor: AppColors.green500,
        boxShadow: [_boxShadow],
      ),
    );
  }

  @override
  showError(String message, {Duration? duration}) {
    InteractiveToast.slide(
      overlayState: NavigationUtil.I.navigatorKey.currentState?.overlay,
      title: TextWidget(message),
      trailing: const Icon(
        Icons.warning_rounded,
        color: AppColors.red600,
        size: 20,
      ),
      toastSetting: _toastSetting.copyWith(displayDuration: duration),
      toastStyle: ToastStyle(
        padding: _padding,
        progressBarColor: AppColors.red600,
        boxShadow: [_boxShadow],
      ),
    );
  }

  /// Shows success or error message based on success and failure state
  @override
  showDataStateToast(DataState dataState, {String message = ""}) {
    if (dataState is! SuccessState) {
      showError(dataState.message!);
    } else if (message.isNotEmpty) {
      showSuccess(message);
    }
  }
}

/// A util class for accessing [ToastMessageService]
class ToastMessageUtil {
  ToastMessageUtil._();

  /// Returns the registered instance of [ToastMessageService] which is always the same
  static ToastMessageService get I => GetIt.I<ToastMessageService>();
}
