import 'package:injectable/injectable.dart';

import '../../../../auth/domain/use_cases/check_authentication_use_case.dart';

@LazySingleton()
class DashboardCubitUseCases {
  final CheckAuthenticationUseCase checkAuthentication;

  const DashboardCubitUseCases({required this.checkAuthentication});
}
