import 'package:injectable/injectable.dart';

import '../../../../core/data/errors/data_handler.dart';
import '../../../../core/services/internet/internet_service.dart';
import '../../../../core/utils/type_defs.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/requests/login_request.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImplementation implements AuthRepository {
  final InternetService internet;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImplementation({
    required this.internet,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  FutureData<UserData> login(LoginRequest request) {
    return DataHandler.fetchWithFallback(
      internet.isConnected,
      remoteCallback: () => remoteDataSource.login(request),
    );
  }

  @override
  FutureBool saveUserData(UserData userData) =>
      localDataSource.saveUserData(userData);

  @override
  FutureData<UserData> getUserData() => localDataSource.getUserData();

  @override
  FutureBool checkAUth() {
    return DataHandler.fetchWithFallback(
      internet.isConnected,
      remoteCallback: () => remoteDataSource.checkAUth(),
    );
  }
}
