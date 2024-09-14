import '../../../../core/utils/type_defs.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entities/requests/login_request.dart';
import '../entities/user_data.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends UseCase<UserData, LoginRequest> {
  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  FutureData<UserData> call(LoginRequest request) =>
      _authRepository.login(request);
}
