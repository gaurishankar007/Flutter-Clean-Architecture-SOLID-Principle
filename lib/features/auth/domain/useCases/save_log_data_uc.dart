import '../../../../core/resources/data_state.dart';
import '../../../../core/useCase/use_case_param.dart';
import '../../data/models/logData/log_data_model.dart';
import '../repositories/auth_repo.dart';

class SaveLogDataUseCase extends UCP<bool, LogDataModel> {
  final AuthRepo _authRepo;

  SaveLogDataUseCase(this._authRepo);

  @override
  Future<DataState<bool>> call(LogDataModel param) async {
    return await _authRepo.saveLogData(param);
  }
}
