import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../constants/app_colors.dart';
import '../../utils/ui_helpers.dart';
import '../navigation/navigation_service.dart';

abstract class BottomSheetService {
  Future<T?> show<T>({BuildContext? context, Widget? child});
}

@LazySingleton(as: BottomSheetService)
class BottomSheetServiceImplementation extends BottomSheetService {
  final NavigationService _navigationService;

  BottomSheetServiceImplementation({
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

  @override
  Future<T?> show<T>({BuildContext? context, Widget? child}) async {
    context ??= _navigationService.navigatorKey.currentContext;
    if (context == null) return null;

    return await showModalBottomSheet<T>(
      context: context,
      backgroundColor: AppColors.white,
      barrierColor: AppColors.black.withAlpha(150),
      useSafeArea: true,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: false,
      scrollControlDisabledMaxHeightRatio: .95,
      shape: RoundedRectangleBorder(borderRadius: UIHelpers.largeTRadius),
      builder: (builder) {
        return ClipRRect(borderRadius: UIHelpers.largeTRadius, child: child);
      },
    );
  }
}

/// A util class for accessing [BottomSheetService]
class BottomSheetUtil {
  BottomSheetUtil._();

  /// Returns the registered instance of [BottomSheetService] which is always the same
  static BottomSheetService get I => GetIt.I<BottomSheetService>();
}
