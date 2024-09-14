part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final int activeIndex;

  const DashboardState({required this.activeIndex});

  factory DashboardState.initial() => const DashboardState(activeIndex: 0);

  copyWith({int? activeIndex}) =>
      DashboardState(activeIndex: activeIndex ?? this.activeIndex);

  @override
  List<Object> get props => [
        activeIndex,
      ];
}
