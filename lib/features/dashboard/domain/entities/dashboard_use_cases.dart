import 'package:injectable/injectable.dart';

import '../../../auth/domain/use_cases/check_authentication_use_case.dart';

@LazySingleton()
class DashboardUseCases {
  final CheckAuthenticationUseCase checkAuthentication;

  const DashboardUseCases({required this.checkAuthentication});
}
