part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final int activeIndex;

  const DashboardState({
    required this.activeIndex,
  });

  @override
  List<Object> get props => [activeIndex];
}
