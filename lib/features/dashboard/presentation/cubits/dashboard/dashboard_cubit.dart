import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../../../core/utils/base_cubit/base_cubit.dart';
import '../../../../../core/utils/type_defs.dart';
import 'dashboard_cubit_use_cases.dart';

part 'dashboard_state.dart';

@injectable
class DashboardCubit extends BaseCubit<DashboardState> {
  final DashboardCubitUseCases _useCases;
  int _activeIndex = 0;

  DashboardCubit({
    required DashboardCubitUseCases useCases,
  })  : _useCases = useCases,
        super(DashboardState.initial());

  initialize() async {
    /// If token is expired, log out and don't perform other operations
    // final dataState = await _verifyToken();
    // if (dataState is! SuccessState) return;
  }

  setIndex(int index) {
    if (_activeIndex == index && index != 0) return;

    _activeIndex = index;
    emit(state.copyWith(activeIndex: _activeIndex));

    switch (index) {
      case 0:
        return replaceRoute(HOME_PATH);

      case 1:
        return replaceRoute(SETTING_PATH);

      default:
        return;
    }
  }

  /// Check whether the token is expired or not
  FutureBool verifyToken() async => await _useCases.checkAuthentication.call();
}
