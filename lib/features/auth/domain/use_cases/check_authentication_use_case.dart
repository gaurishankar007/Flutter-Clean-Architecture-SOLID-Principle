import '../../../../core/utils/type_defs.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class CheckAuthenticationUseCase extends UseCaseNoParameter<bool> {
  final AuthRepository _authRepository;

  CheckAuthenticationUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  FutureBool call() => _authRepository.checkAUth();
}
