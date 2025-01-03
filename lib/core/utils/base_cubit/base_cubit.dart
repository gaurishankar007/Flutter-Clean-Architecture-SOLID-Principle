import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/auth/domain/entities/user_data.dart';
import '../../data/states/data_state.dart';
import '../../services/image_picker/image_picker_service.dart';
import '../../services/message/toast_message_service.dart';
import '../../services/navigation/navigation_service.dart';
import '../../services/user_data_service.dart';

part 'base_cubit_mixin.dart';
part 'state_status.dart';

abstract class BaseCubit<BaseState> extends Cubit<BaseState>
    with BaseCubitMixin {
  BaseCubit(super.initialState);
}

abstract class BaseState extends Equatable {
  final StateStatus stateStatus;

  const BaseState({
    this.stateStatus = StateStatus.initial,
  });

  @override
  List<Object?> get props => [
        stateStatus,
      ];
}
