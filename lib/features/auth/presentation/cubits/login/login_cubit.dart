// import 'dart:io';
import 'package:equatable/equatable.dart';

import '../../../../../core/data/states/data_state.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../../../core/utils/base_cubit/base_cubit.dart';
import '../../../domain/entities/login_use_cases.dart';
// import '../../../domain/entities/requests/login_request.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/entities/user_data.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final LoginUseCases _useCases;
  bool _passwordVisibility = false;
  bool _saveUserCredential = false;

  LoginCubit({
    required LoginUseCases useCases,
  })  : _useCases = useCases,
        super(const LoginState.initial());

  /// Emits a new State
  _refreshState() {
    final newState = LoginState(
      passwordVisibility: _passwordVisibility,
      saveUserCredential: _saveUserCredential,
    );
    emit(newState);
  }

  togglePasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    _refreshState();
  }

  toggleUserCredentialSaving() {
    _saveUserCredential = !_saveUserCredential;
    _refreshState();
  }

  login({required String username, required String password}) async {
    // String fcmToken = "";
    // String deviceType = Platform.isAndroid ? "android" : "ios";

    // final form = LoginRequest(
    //   username: username,
    //   password: password,
    //   fcmToken: fcmToken,
    //   deviceType: deviceType,
    // );

    // final dataState = await _useCases.login.call(form);
    await Future.delayed(const Duration(seconds: 2));
    final dataState = SuccessState(
      data: UserData(
        accessToken: "access",
        refreshToken: "refresh",
        user: User(
          id: 1,
          firstName: "Flutter",
          lastName: "Developers",
          username: username,
          email: "email",
          isActive: true,
        ),
      ),
    );
    showDataStateToast(dataState);

    setUserData(dataState.data!);
    if (_saveUserCredential) {
      await _useCases.saveUserData.call(dataState.data!);
    }
    replaceRoute(DASHBOARD_PATH);
  }
}
