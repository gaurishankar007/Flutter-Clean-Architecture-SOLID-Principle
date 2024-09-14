import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_cubit_service_mixin.dart';

class BaseCubit<T> extends Cubit<T> with BaseCubitServiceMixin {
  BaseCubit(super.initialState);
}
