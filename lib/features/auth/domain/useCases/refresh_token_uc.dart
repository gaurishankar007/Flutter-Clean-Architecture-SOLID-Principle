import '../../../../core/resources/data_state.dart';
import '../../../../core/useCase/use_case.dart';
import '../repositories/auth_repo.dart';

class RefreshTokenUseCase extends UC<String> {
  final AuthRepo _authRepo;

  RefreshTokenUseCase(this._authRepo);

  @override
  Future<DataState<String>> call() async {
    return await _authRepo.refreshToken();
  }
}
