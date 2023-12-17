import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/features/auth/data/models/logData/log_data_model.dart';
import 'package:boilerplate/features/auth/data/models/userData/user_data_model.dart';

abstract class AuthRepo {
  Future<DataState<UserDataModel>> login(LogDataModel param);
  Future<DataState<bool>> saveUserData(UserDataModel param);
  Future<DataState<UserDataModel>> getUserData();
  Future<DataState<bool>> saveLogData(LogDataModel param);
  Future<DataState<LogDataModel>> getLogData();
  Future<DataState<String>> refreshToken();
}
