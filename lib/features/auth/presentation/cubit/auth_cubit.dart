import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/forms/sign_in_form.dart';
import '../../domain/forms/sign_up_form.dart';
import '../dependencies/auth_cubit_dependency.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthCubitDependency dependency;

  AuthCubit({required this.dependency}) : super(AuthState.initial());

  removeSignUpError() => emit(state.copyWith(signUpError: ""));

  Future<bool> sigIn({required String email, required String password}) async {
    emit(state.copyWith(signInError: ""));

    final form = SignInForm(email: email, password: password);
    final dataState = await dependency.signInUseCase.call(form);

    if (dataState is DataSuccess) {
      dependency.userService.userData = dataState.data!;
      return true;
    }

    emit(state.copyWith(signInError: dataState.error!.message));
    return false;
  }

  Future<bool> sigUp({required SignUpForm form}) async {
    emit(state.copyWith(signUpError: ""));

    if (form.password != form.confirmPassword) {
      emit(state.copyWith(signUpError: "Password did not matched with confirm password"));
      return false;
    }

    final dataState = await dependency.signUpUseCase.call(form);
    if (dataState is DataSuccess) {
      dependency.userService.userData = dataState.data!;
      return true;
    }

    emit(state.copyWith(signUpError: dataState.error!.message));
    return false;
  }
}
