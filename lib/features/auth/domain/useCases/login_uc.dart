import '../../../../core/resources/data_state.dart';
import '../../../../core/useCase/use_case_param.dart';
import '../../data/models/logData/log_data_model.dart';
import '../../data/models/userData/user_data_model.dart';
import '../repositories/auth_repo.dart';

class LoginUseCase extends UCP<UserDataModel, LogDataModel> {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  @override
  Future<DataState<UserDataModel>> call(LogDataModel param) async {
    return await _authRepo.login(param);
  }
}
