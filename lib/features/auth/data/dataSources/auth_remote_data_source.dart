import '../../../../core/constants/api_paths.dart';
import '../../../../core/errors/error_data.dart';
import '../../../../core/errors/exception_handler.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/services/network_service.dart';
import '../../domain/forms/sign_in_form.dart';
import '../../domain/forms/sign_up_form.dart';
import '../models/user_data_model.dart';

abstract class AuthRemoteDataSource {
  FutureData<UserDataModel> signIn(SignInForm form);
  FutureData<UserDataModel> signUp(SignUpForm form);
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final NetworkService networkService;

  AuthRemoteDataSourceImplementation({required this.networkService});

  @override
  FutureData<UserDataModel> signIn(SignInForm parameter) async {
    return await exceptionHandler(() async {
      final requestForm = DioForm(
        signInUrl,
        data: parameter.toJson,
        options: DioOptions(
          validateStatus: (status) => status == 200 || status == 401,
        ),
      );
      final response = await networkService.post(requestForm);

      if (response.data["status"]) {
        UserDataModel userData = UserDataModel.fromJson(response.data["data"]);
        return DataSuccess(data: userData);
      }

      return DataFailure<UserDataModel>(
        error: ErrorData(
          error: "Authentication error",
          message: response.data["error"],
          type: ErrorType.invalidUserCredential,
        ),
      );
    });
  }

  @override
  FutureData<UserDataModel> signUp(SignUpForm parameter) async {
    return await exceptionHandler(() async {
      final requestForm = DioForm(
        signUpUrl,
        data: parameter.toJson,
        options: DioOptions(
          validateStatus: (status) => status == 200 || status == 400,
        ),
      );
      final response = await networkService.post(requestForm);

      bool status = response.data["status"];

      if (status) {
        UserDataModel userData = UserDataModel.fromJson(response.data["data"]);
        return DataSuccess(data: userData);
      }

      return DataFailure<UserDataModel>(
        error: ErrorData(
          error: "Registration error",
          message: response.data["error"],
          type: ErrorType.badRequest,
        ),
      );
    });
  }
}
