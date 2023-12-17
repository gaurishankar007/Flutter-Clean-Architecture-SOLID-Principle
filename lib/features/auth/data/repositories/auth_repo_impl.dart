import '../../../../core/resources/data_state.dart';
import '../../../../injection/injector.dart';
import '../../domain/repositories/auth_repo.dart';
import '../dataSources/auth_local_source.dart';
import '../dataSources/auth_remote_source.dart';
import '../models/logData/log_data_model.dart';
import '../models/userData/user_data_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteSourceImpl _remoteSource = AuthRemoteSourceImpl();
  final AuthLocalSourceImpl _localSource = AuthLocalSourceImpl();

  @override
  Future<DataState<UserDataModel>> login(LogDataModel param) async {
    if (network.isConnected) return _remoteSource.login(param);
    return NetworkFailureState();
  }

  @override
  Future<DataState<bool>> saveUserData(UserDataModel param) async {
    return _localSource.saveUserData(param);
  }

  @override
  Future<DataState<UserDataModel>> getUserData() async {
    return _localSource.getUserData();
  }

  @override
  Future<DataState<bool>> saveLogData(LogDataModel param) async {
    return _localSource.saveLogData(param);
  }

  @override
  Future<DataState<LogDataModel>> getLogData() async {
    return _localSource.getLogData();
  }

  @override
  Future<DataState<String>> refreshToken() async {
    if (network.isConnected) return _remoteSource.refreshToken();
    return NetworkFailureState();
  }

}
