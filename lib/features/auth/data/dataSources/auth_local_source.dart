import 'package:shared_preferences/shared_preferences.dart';
import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/core/exception/exception_handler.dart';
import 'package:boilerplate/features/auth/data/models/token_model.dart';

abstract class AuthLocalSource {
  Future<DataState<bool>> saveToken(TokenDataModel param);
  Future<DataState<TokenDataModel>> getToken();
}

class AuthLocalSourceImpl implements AuthLocalSource {
  @override
  Future<DataState<bool>> saveToken(TokenDataModel param) async {
    return await tryCatch<bool>(
      callBack: () async {
        SharedPreferences sharedP = await SharedPreferences.getInstance();

        sharedP.setString("accessToken", param.accessToken);
        sharedP.setString("refreshToken", param.refreshToken);

        return SuccessState(data: true);
      },
      errorMsg: "Failed to save token data",
      errorType: ErrorType.sharedPreferenceException,
    );
  }

  @override
  Future<DataState<TokenDataModel>> getToken() async {
    return await tryCatch<TokenDataModel>(
      callBack: () async {
        SharedPreferences sharedP = await SharedPreferences.getInstance();

        String accessToken = sharedP.getString("accessToken") ?? "";
        String refreshToken = sharedP.getString("refreshToken") ?? "";

        return SuccessState(
          data: TokenDataModel(
            accessToken: accessToken,
            refreshToken: refreshToken,
          ),
        );
      },
      errorMsg: "Failed to save token data",
      errorType: ErrorType.sharedPreferenceException,
    );
  }
}
