import 'package:flutter/material.dart' show WidgetsBinding, BoxConstraints;
import 'package:injectable/injectable.dart';

import '../utils/screen_util/screen_util.dart';
import 'base/base_cubit.dart';

/// Using a Cubit to notify for rebuilds instead of layout builder because
/// - Layout builder might rebuild the widget multiple times based on the constraints
@injectable
class RebuildCubit extends BaseCubit<int> {
  RebuildCubit() : super(0);

  /// Tracks the number of rebuild attempts.
  /// Initialized to -1 to handle the first build scenario.
  int _rebuildCount = -1;

  /// Updates screen constraints, increments the rebuild counter and updates the state.
  void rebuild(BoxConstraints constraints) {
    ScreenUtil.I.configureScreen(constraints.biggest);
    _rebuildCount++;

    // Avoid emitting a new state value during the first build of the MaterialApp.
    if (_rebuildCount < 1) return;

    // Delay update to post-frame to avoid premature builds or rebuilds during build.
    WidgetsBinding.instance.addPostFrameCallback((_) => emit(_rebuildCount));
  }
}
