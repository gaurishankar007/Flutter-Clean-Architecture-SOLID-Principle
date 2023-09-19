import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/core/useCase/use_case_param.dart';
import 'package:boilerplate/features/auth/data/models/token_model.dart';
import 'package:boilerplate/features/auth/domain/parameter/login_param.dart';
import 'package:boilerplate/features/auth/domain/repositories/auth_repo.dart';

class LoginUseCase extends UCP<TokenDataModel, LoginParameter> {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  @override
  Future<DataState<TokenDataModel>> call(LoginParameter param) async {
    return await _authRepo.login(param);
  }
}
