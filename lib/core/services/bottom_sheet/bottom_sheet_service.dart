import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../features/app/presentation/base_widgets/bottom_sheet/generic_bottom_sheet.dart';

abstract class BottomSheetService {
  Future<T?> show<T>({BuildContext? context, Widget? child});
}

@LazySingleton(as: BottomSheetService)
class BottomSheetServiceImplementation extends BottomSheetService {
  @override
  Future<T?> show<T>({BuildContext? context, Widget? child}) async =>
      await showGenericBottomSheet(context: context, child: child);
}

/// A util class for accessing [BottomSheetService]
class BottomSheetUtil {
  BottomSheetUtil._();

  /// Returns the registered instance of [BottomSheetService] which is always the same
  static BottomSheetService get I => GetIt.I<BottomSheetService>();
}
