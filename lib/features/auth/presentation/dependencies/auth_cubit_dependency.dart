import '../../../../core/services/user_service.dart';
import '../../domain/useCases/save_user_data_uc.dart';
import '../../domain/useCases/sign_in_uc.dart';
import '../../domain/useCases/sign_up_uc.dart';

class AuthCubitDependency {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SaveUserDataUseCase saveUserDataUseCase;
  final UserService userService;

  const AuthCubitDependency({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.saveUserDataUseCase,
    required this.userService,
  });
}
