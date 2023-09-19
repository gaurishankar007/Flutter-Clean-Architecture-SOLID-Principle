import 'package:boilerplate/core/useCase/use_case_param.dart';
import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/features/auth/data/models/token_model.dart';
import 'package:boilerplate/features/auth/domain/repositories/auth_repo.dart';

class SaveTokenUseCase extends UCP<bool, TokenDataModel> {
  final AuthRepo _authRepo;

  SaveTokenUseCase(this._authRepo);

  @override
  Future<DataState<bool>> call(TokenDataModel param) async {
    return await _authRepo.saveToken(param);
  }
}
