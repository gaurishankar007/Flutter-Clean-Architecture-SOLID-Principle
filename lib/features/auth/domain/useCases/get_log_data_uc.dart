import '../../../../core/resources/data_state.dart';
import '../../../../core/useCase/use_case.dart';
import '../../data/models/logData/log_data_model.dart';
import '../repositories/auth_repo.dart';

class GetLogDataUseCase extends UC<LogDataModel> {
  final AuthRepo _authRepo;

  GetLogDataUseCase(this._authRepo);

  @override
  Future<DataState<LogDataModel>> call() async {
    return await _authRepo.getLogData();
  }
}
