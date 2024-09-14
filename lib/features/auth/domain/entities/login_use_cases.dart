import '../use_cases/login_use_case.dart';
import '../use_cases/save_user_data_use_case.dart';

class LoginUseCases {
  final LoginUseCase login;
  final SaveUserDataUseCase saveUserData;

  const LoginUseCases({
    required this.login,
    required this.saveUserData,
  });
}
