import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/features/auth/data/models/token_model.dart';
import 'package:boilerplate/features/auth/domain/parameter/login_param.dart';

abstract class AuthRepo {
  Future<DataState<TokenDataModel>> login(LoginParameter param);
  Future<DataState<bool>> saveToken(TokenDataModel param);
  Future<DataState<TokenDataModel>> getToken();
}
