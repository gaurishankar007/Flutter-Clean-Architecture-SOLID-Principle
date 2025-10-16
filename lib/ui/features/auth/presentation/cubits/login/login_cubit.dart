// import 'dart:io';
import 'package:injectable/injectable.dart';

import '../../../../../../routing/routes.gr.dart';
import '../../../../../../core/data_states/data_state.dart';
import '../../../../../../core/domain/entities/user.dart';
import '../../../../../core/cubits/base/base_cubit.dart';
import '../../../domain/entities/authentication.dart';
import '../../../domain/entities/user_data.dart';
import 'login_cubit_use_cases.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends BaseCubit<LoginState> {
  final LoginCubitUseCases _useCases;
  bool _passwordVisibility = false;
  bool _saveUserCredential = false;

  LoginCubit({required LoginCubitUseCases useCases})
    : _useCases = useCases,
      super(const LoginState.initial());

  /// Emits a new State
  void _refreshState() {
    final newState = LoginState(
      passwordVisibility: _passwordVisibility,
      saveUserCredential: _saveUserCredential,
    );
    emit(newState);
  }

  void togglePasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    _refreshState();
  }

  void toggleUserCredentialSaving() {
    _saveUserCredential = !_saveUserCredential;
    _refreshState();
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final authentication = Authentication(
      username: username,
      password: password,
    );
    final dataState = await _useCases.login.call(authentication);
    showDataStateToast(dataState);

    if (dataState.hasData) {
      setUserData(dataState.data!);
      if (_saveUserCredential) {
        await _useCases.saveUserData.call(dataState.data!);
      }
      replaceAllRoute(const HomeRoute());
    }
  }

  Future<void> fakeLogin({
    required String username,
    required String password,
  }) async {
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
    setUserData(dataState.data!);
    if (_saveUserCredential) {
      await _useCases.saveUserData.call(dataState.data!);
    }

    replaceAllRoute(const HomeRoute());
  }
}
