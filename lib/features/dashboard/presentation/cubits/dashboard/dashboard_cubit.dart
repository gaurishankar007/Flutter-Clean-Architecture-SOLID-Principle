import 'package:injectable/injectable.dart';

import '../../../../../core/config/routes/routes.gr.dart';
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

  Future<void> initialize() async {
    /// If token is expired, log out and don't perform other operations
    // final dataState = await _verifyToken();
    // if (dataState is! SuccessState) return;
  }

  void setIndex(int index) {
    if (_activeIndex == index && index != 0) return;

    _activeIndex = index;
    emit(state.copyWith(activeIndex: _activeIndex));

    switch (index) {
      case 0:
        replaceAllRoute(const HomeRoute());
        return;

      case 1:
        replaceAllRoute(const SettingRoute());
        return;

      default:
        return;
    }
  }

  /// Check whether the token is expired or not
  FutureBool verifyToken() async => await _useCases.checkAuthentication.call();
}
