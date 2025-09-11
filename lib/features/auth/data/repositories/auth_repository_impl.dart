import 'package:clean_architecture/features/auth/data/models/requests/authentication_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data_handling/data_handler.dart';
import '../../../../core/services/internet/internet_service.dart';
import '../../../../core/utils/type_defs.dart';
import '../../domain/entities/authentication.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final InternetService internet;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.internet,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  FutureData<UserData> login(Authentication authentication) {
    return DataHandler.fetchWithFallback(
      internet.isConnected,
      remoteCallback: () => remoteDataSource
          .login(AuthenticationRequest.fromDomain(authentication)),
    );
  }

  @override
  FutureBool saveUserData(UserData userData) =>
      localDataSource.saveUserData(userData);

  @override
  FutureData<UserData> getUserData() => localDataSource.getUserData();

  @override
  FutureBool checkAuth() {
    return DataHandler.fetchWithFallback(
      internet.isConnected,
      remoteCallback: () => remoteDataSource.checkAUth(),
    );
  }
}
