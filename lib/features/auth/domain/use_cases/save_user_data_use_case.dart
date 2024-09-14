import '../../../../core/utils/type_defs.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entities/user_data.dart';
import '../repositories/auth_repository.dart';

class SaveUserDataUseCase extends UseCase<bool, UserData> {
  final AuthRepository _authRepository;

  SaveUserDataUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  FutureBool call(UserData request) => _authRepository.saveUserData(request);
}
