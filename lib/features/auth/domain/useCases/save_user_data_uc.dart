import '../../../../core/resources/data_state.dart';
import '../../../../core/useCase/use_case.dart';
import '../entities/user_data.dart';
import '../repositories/auth_repo.dart';

class SaveUserDataUseCase implements UseCase<bool, UserData> {
  final AuthRepository authRepository;
  SaveUserDataUseCase({required this.authRepository});

  @override
  FutureData<bool> call(UserData parameter) async => await authRepository.saveUserData(parameter);
}
