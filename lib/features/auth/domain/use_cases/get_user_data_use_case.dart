import '../../../../core/utils/use_case/use_case.dart';
import '../../../../core/utils/type_defs.dart';
import '../entities/user_data.dart';
import '../repositories/auth_repository.dart';

class GetUserDataUseCase extends UseCaseNoParameter<UserData> {
  final AuthRepository _authRepository;

  GetUserDataUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  FutureData<UserData> call() => _authRepository.getUserData();
}
