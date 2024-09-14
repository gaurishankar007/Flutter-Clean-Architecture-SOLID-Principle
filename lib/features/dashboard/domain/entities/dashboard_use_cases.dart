import '../../../auth/domain/use_cases/check_authentication_use_case.dart';

class DashboardUseCases {
  final CheckAuthenticationUseCase checkAuthentication;

  const DashboardUseCases({required this.checkAuthentication});
}
