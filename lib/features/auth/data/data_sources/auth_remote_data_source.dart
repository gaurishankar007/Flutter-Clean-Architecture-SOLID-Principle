import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/data/errors/data_handler.dart';
import '../../../../core/services/api/api_service.dart';
import '../../../../core/utils/type_defs.dart';
import '../../domain/requests/login_request.dart';
import '../models/user_data_model.dart';

abstract class AuthRemoteDataSource {
  FutureData<UserDataModel> login(LoginRequest request);
  FutureBool checkAUth();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final ApiService _dioClient;

  const AuthRemoteDataSourceImplementation({
    required ApiService dioClient,
  }) : _dioClient = dioClient;

  @override
  FutureData<UserDataModel> login(LoginRequest request) {
    return DataHandler.safeApiCall(
      request: () => _dioClient.post(
        ApiEndpoints.login,
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
      request: () => _dioClient.get(ApiEndpoints.checkAuth),
      fromJson: (json) => true,
    );
  }
}
