import 'package:boilerplate/core/exception/exception_handler.dart';
import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/features/auth/data/dataSources/auth_local_source.dart';
import 'package:boilerplate/features/auth/data/dataSources/auth_remote_source.dart';
import 'package:boilerplate/features/auth/data/models/token_model.dart';
import 'package:boilerplate/features/auth/domain/parameter/login_param.dart';
import 'package:boilerplate/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteSourceImpl _remoteSource = AuthRemoteSourceImpl();
  final AuthLocalSourceImpl _localSource = AuthLocalSourceImpl();

  @override
  Future<DataState<TokenDataModel>> login(LoginParameter param) async {
    return checkConnection(_remoteSource.login(param));
  }

  @override
  Future<DataState<bool>> saveToken(TokenDataModel param) {
    return _localSource.saveToken(param);
  }

  @override
  Future<DataState<TokenDataModel>> getToken() {
    return _localSource.getToken();
  }
}
