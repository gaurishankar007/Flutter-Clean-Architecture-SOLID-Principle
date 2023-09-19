import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:boilerplate/core/navigation/navigation.dart';
import 'package:boilerplate/core/constants/route_path.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState?> {
  final List<String> unloadingRoutes = [];
  final List<String> inventoryRoutes = [];
  final List<String> pickListRoutes = [];
  int activeIndex = 0;

  DashboardCubit() : super(null) {
    emit(_state);
  }

  DashboardState get _state => DashboardState(activeIndex: activeIndex);

  setIndex(int index) {
    if (activeIndex == index) return;

    activeIndex = index;
    emit(_state);

    switch (index) {
      case 0:
        return navWithPath(kHomeP);

      default:
        return;
    }
  }

  findIndex(String routeName) {
    if (routeName == kHomeR && activeIndex != 0) {
      activeIndex = 0;
    } else if (unloadingRoutes.contains(routeName) && activeIndex != 1) {
      activeIndex = 1;
    } else if (inventoryRoutes.contains(routeName) && activeIndex != 2) {
      activeIndex = 2;
    } else if (pickListRoutes.contains(routeName) && activeIndex != 3) {
      activeIndex = 3;
    }

    emit(_state);
  }
}
