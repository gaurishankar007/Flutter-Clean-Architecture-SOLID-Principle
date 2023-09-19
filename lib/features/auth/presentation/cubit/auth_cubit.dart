import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/core/constants/page_transitions.dart';
import 'package:boilerplate/core/constants/route_path.dart';
import 'package:boilerplate/core/navigation/navigation.dart';
import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/features/auth/domain/parameter/login_param.dart';
import 'package:boilerplate/features/auth/domain/useCases/save_token_uc.dart';
import 'package:boilerplate/features/auth/domain/useCases/login_uc.dart';
import 'package:boilerplate/injection/injector.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState?> {
  final _loginUC = LoginUseCase(authRepoImpl);
  final _saveTokenUC = SaveTokenUseCase(authRepoImpl);

  final PageController pageController = PageController();
  bool pVisibility = false;
  bool rememberMe = false;
  bool loading = false;

  String userId = "";
  String token = "";

  AuthCubit() : super(null) {
    emit(_state);
  }

  AuthState get _state => AuthState(
        pageController: pageController,
        pVisibility: pVisibility,
        rememberMe: rememberMe,
        loading: loading,
      );

  passwordV() {
    pVisibility = !pVisibility;
    emit(_state);
  }

  remember() {
    rememberMe = !rememberMe;
    emit(_state);
  }

  _reset() {
    pVisibility = false;
    rememberMe = false;
    emit(_state);
  }

  Future<bool> onWillPop() async {
    if (pageController.page != 0) {
      pageController.previousPage(duration: duration, curve: curve);
      return false;
    }

    userId = "";
    token = "";
    return true;
  }

  login(LoginParameter param) async {
    loading = true;
    emit(_state);

    final data = await _loginUC.call(param);

    loading = false;
    emit(_state);

    if (data is SuccessState) {
      appData.setTokenModel = data.data!;

      if (rememberMe) {
        await _saveTokenUC.call(data.data!);
      }

      navWithPath(kDashboardP);
      return _reset();
    }

    snackBar.snackThis(color: kR600, data: data);
  }

  logOut() async {
    navWithPath(kLoginP);
    SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
    appData.removeTokenModel();
  }
}
