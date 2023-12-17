import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/exception/exception_handler.dart';
import '../../../../core/resources/data_state.dart';
import '../models/logData/log_data_model.dart';
import '../models/userData/user_data_model.dart';

abstract class AuthLocalSource {
  Future<DataState<bool>> saveUserData(UserDataModel param);
  Future<DataState<UserDataModel>> getUserData();
  Future<DataState<bool>> saveLogData(LogDataModel param);
  Future<DataState<LogDataModel>> getLogData();
}

class AuthLocalSourceImpl implements AuthLocalSource {
  @override
  Future<DataState<bool>> saveUserData(UserDataModel param) async {
    return await tryCatch<bool>(
      callBack: () async {
        SharedPreferences sharedP = await SharedPreferences.getInstance();
        sharedP.setString("userData", jsonEncode(param.toJson()));

        return SuccessState(data: true);
      },
      errorMsg: "Failed to save user data",
      errorType: ErrorType.sharedPreferenceException,
    );
  }

  @override
  Future<DataState<UserDataModel>> getUserData() async {
    return await tryCatch<UserDataModel>(
      callBack: () async {
        SharedPreferences sharedP = await SharedPreferences.getInstance();
        String userData = sharedP.getString("userData") ?? "";

        if (userData.isNotEmpty) {
          UserDataModel userDataModel =
              UserDataModel.fromJson(jsonDecode(userData));

          return SuccessState(data: userDataModel);
        }

        return FailureState<UserDataModel>(
          error: "User data not found.",
          errorMsg: "User data is not saved.",
        );
      },
      errorMsg: "Failed to get user data",
      errorType: ErrorType.sharedPreferenceException,
    );
  }

  @override
  Future<DataState<bool>> saveLogData(LogDataModel param) async {
    return await tryCatch<bool>(
      callBack: () async {
        SharedPreferences sharedP = await SharedPreferences.getInstance();
        sharedP.setString("logData", jsonEncode(param.toJson()));

        return SuccessState(data: true);
      },
      errorMsg: "Failed to log user data",
      errorType: ErrorType.sharedPreferenceException,
    );
  }

  @override
  Future<DataState<LogDataModel>> getLogData() async {
    return await tryCatch<LogDataModel>(
      callBack: () async {
        SharedPreferences sharedP = await SharedPreferences.getInstance();

        String logData = sharedP.getString("logData") ?? "";

        if (logData.isNotEmpty) {
          LogDataModel logDataModel =
              LogDataModel.fromJson(jsonDecode(logData));

          return SuccessState(data: logDataModel);
        }

        return FailureState<LogDataModel>(
          error: "Log data not found.",
          errorMsg: "Log data is not saved.",
        );
      },
      errorMsg: "Failed to get log data",
      errorType: ErrorType.sharedPreferenceException,
    );
  }
}
