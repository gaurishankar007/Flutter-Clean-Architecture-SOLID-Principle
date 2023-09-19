import 'package:dio/dio.dart';
import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/core/exception/exception_handler.dart';
import 'package:boilerplate/core/constants/api_path.dart';
import 'package:boilerplate/features/auth/data/models/token_model.dart';
import 'package:boilerplate/features/auth/domain/parameter/login_param.dart';
import 'package:boilerplate/injection/injector.dart';

abstract class AuthRemoteSource {
  Future<DataState<TokenDataModel>> login(LoginParameter param);
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  @override
  Future<DataState<TokenDataModel>> login(LoginParameter param) async {
    return await tryCatch<TokenDataModel>(
      callBack: () async {
        Map<String, String> data = {
          "username": param.username,
          "password": param.password,
        };

        final response = await dio.post(
          loginUrl,
          data: data,
          options: Options(
            validateStatus: (status) => status == 200 || status == 400,
          ),
        );

        if (response.statusCode == 200) {
          final data = response.data;
          final String token = data["_token"] ?? "";

          if (token.isEmpty) {
            return FailureState<TokenDataModel>(
              error: "Token data is empty",
              errorMsg: "Server error",
              errorType: ErrorType.invalidUserCredential,
            );
          }

          TokenDataModel tokenDataModel = TokenDataModel(
            accessToken: token,
            refreshToken: "",
          );

          return SuccessState(data: tokenDataModel);
        }

        return FailureState<TokenDataModel>(
          error: "User credentials did not match",
          errorMsg: "Invalid User Credential",
          errorType: ErrorType.invalidUserCredential,
        );
      },
      errorMsg: "Failed to login. Error occurred.",
    );
  }
}
