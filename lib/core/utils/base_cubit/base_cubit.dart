import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service_mixin.dart';

/// The status of a bloc state when there is only a single state
/// * loading
/// * completed
/// * noInternet
enum StateStatus {
  initial,
  loading,
  loaded,
  noInternet,
}

abstract class BaseState extends Equatable {
  final StateStatus stateStatus;

  const BaseState({this.stateStatus = StateStatus.initial});

  @override
  List<Object?> get props => [
        stateStatus,
      ];
}

abstract class BaseCubit<BaseState> extends Cubit<BaseState> with ServiceMixin {
  BaseCubit(super.initialState);
}
