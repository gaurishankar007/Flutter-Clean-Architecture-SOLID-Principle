import '../../../../core/resources/data_state.dart';
import '../../../../core/useCase/use_case.dart';
import '../../data/models/userData/user_data_model.dart';
import '../repositories/auth_repo.dart';

class GetUserDataUseCase extends UC<UserDataModel> {
  final AuthRepo _authRepo;

  GetUserDataUseCase(this._authRepo);

  @override
  Future<DataState<UserDataModel>> call() async {
    return await _authRepo.getUserData();
  }
}
