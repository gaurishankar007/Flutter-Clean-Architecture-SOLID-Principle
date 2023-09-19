import 'package:boilerplate/core/useCase/use_case.dart';
import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/features/auth/data/models/token_model.dart';
import 'package:boilerplate/features/auth/domain/repositories/auth_repo.dart';

class GetTokenUseCase extends UC<TokenDataModel> {
  final AuthRepo _authRepo;

  GetTokenUseCase(this._authRepo);

  @override
  Future<DataState<TokenDataModel>> call() async {
    return await _authRepo.getToken();
  }
}
