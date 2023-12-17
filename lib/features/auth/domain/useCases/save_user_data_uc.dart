import '../../../../core/resources/data_state.dart';
import '../../../../core/useCase/use_case_param.dart';
import '../../data/models/userData/user_data_model.dart';
import '../repositories/auth_repo.dart';

class SaveUserDataUseCase extends UCP<bool, UserDataModel> {
  final AuthRepo _authRepo;

  SaveUserDataUseCase(this._authRepo);

  @override
  Future<DataState<bool>> call(UserDataModel param) async {
    return await _authRepo.saveUserData(param);
  }
}
