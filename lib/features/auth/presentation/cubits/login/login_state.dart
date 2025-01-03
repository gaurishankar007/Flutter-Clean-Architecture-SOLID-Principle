part of 'login_cubit.dart';

class LoginState extends BaseState {
  final bool passwordVisibility;
  final bool saveUserCredential;

  const LoginState({
    required this.passwordVisibility,
    required this.saveUserCredential,
  });

  const LoginState.initial()
      : passwordVisibility = false,
        saveUserCredential = false;

  @override
  List<Object> get props => [
        passwordVisibility,
        saveUserCredential,
      ];
}
