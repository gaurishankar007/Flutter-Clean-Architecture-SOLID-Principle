import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoint.dart';
import '../../../../core/data/errors/data_handler.dart';
import '../../../../core/services/dio/dio_client.dart';
import '../../../../core/utils/type_defs.dart';
import '../../domain/requests/login_request.dart';
import '../models/user_data_model.dart';

abstract class AuthRemoteDataSource {
  FutureData<UserDataModel> login(LoginRequest request);
  FutureBool checkAUth();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final DioClient _dioClient;

  const AuthRemoteDataSourceImplementation({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  @override
  FutureData<UserDataModel> login(LoginRequest request) {
    return DataHandler.safeApiCall(
      request: () => _dioClient.post(
        ApiEndpoint.login,
        data: request.toJson(),
        options: Options(
          validateStatus: (status) => status == 200 || status == 400,
        ),
      ),
      fromJson: UserDataModel.fromJson,
    );
  }

  @override
  FutureBool checkAUth() {
    return DataHandler.safeApiCall(
      request: () => _dioClient.get(ApiEndpoint.checkAuth),
      fromJson: (json) => true,
    );
  }
}
