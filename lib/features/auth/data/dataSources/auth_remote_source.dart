import 'package:dio/dio.dart';

import '../../../../core/constants/api_path.dart';
import '../../../../core/exception/exception_handler.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../injection/injector.dart';
import '../models/logData/log_data_model.dart';
import '../models/userData/user_data_model.dart';

abstract class AuthRemoteSource {
  Future<DataState<UserDataModel>> login(LogDataModel param);
  Future<DataState<String>> refreshToken();
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  @override
  Future<DataState<UserDataModel>> login(LogDataModel param) async {
    return await tryCatch<UserDataModel>(
      callBack: () async {
        FormData formData = FormData.fromMap({
          "username": param.username,
          "password": param.password,
        });

        final response = await dio.post(
          loginUrl,
          data: formData,
          options: Options(
            validateStatus: (status) => status == 200 || status == 401,
          ),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> data = response.data;
          final String access = data["access"] ?? "";

          if (access.isEmpty) {
            return FailureState<UserDataModel>(
              error: "Token is not found",
              errorMsg: "Server error",
            );
          }

          UserDataModel userDataModel = UserDataModel.fromJson(data);
          return SuccessState(data: userDataModel);
        }

        return FailureState<UserDataModel>(
          error: "User credentials did not match",
          errorMsg: "Invalid User Credential",
          errorType: ErrorType.invalidUserCredential,
        );
      },
      errorMsg: "Failed to login. Error occurred.",
    );
  }

  @override
  Future<DataState<String>> refreshToken() async {
    return await tryCatch<String>(
      callBack: () async {
        final response = await dio.post(
          refreshTokenUrl,
          data: {"refresh": appData.udm.refreshToken},
          options: Options(
            validateStatus: (status) => status == 200 || status == 401,
          ),
        );

        final data = response.data;
        if (response.statusCode == 200) {
          String accessToken = data["access"];
          return SuccessState(data: accessToken);
        }

        return FailureState<String>(
          error: "Token is expired",
          errorMsg: "Invalid Token",
          errorType: ErrorType.tokenExpired,
        );
      },
    );
  }
}
