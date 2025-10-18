import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/login_use_case.dart';
import '../../../domain/use_cases/save_user_data_use_case.dart';

@LazySingleton()
class LoginCubitUseCases {
  final LoginUseCase login;
  final SaveUserDataUseCase saveUserData;

  const LoginCubitUseCases({
    required this.login,
    required this.saveUserData,
  });
}
