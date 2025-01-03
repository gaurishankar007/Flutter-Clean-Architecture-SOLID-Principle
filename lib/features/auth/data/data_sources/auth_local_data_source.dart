import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/data/errors/data_handler.dart';
import '../../../../core/data/states/data_state.dart';
import '../../../../core/services/database/local_database_service.dart';
import '../../../../core/utils/type_defs.dart';
import '../../domain/entities/user_data.dart';
import '../models/user_data_model.dart';

abstract class AuthLocalDataSource {
  FutureBool saveUserData(UserData userData);
  FutureData<UserDataModel> getUserData();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImplementation implements AuthLocalDataSource {
  final LocalDatabaseService localDatabase;
  AuthLocalDataSourceImplementation({required this.localDatabase});

  @override
  FutureBool saveUserData(UserData userData) async {
    return ErrorHandler.catchException(() async {
      localDatabase.setString("userData", jsonEncode(userData.toJson()));
      return const SuccessState(data: true);
    });
  }

  @override
  FutureData<UserDataModel> getUserData() async {
    return ErrorHandler.catchException(() async {
      String userData = await localDatabase.getString("userData") ?? "";

      if (userData.isNotEmpty) {
        final userDataModel = UserDataModel.fromJson(jsonDecode(userData));
        return SuccessState(data: userDataModel);
      }

      return const FailureState<UserDataModel>(error: "User data not found.");
    });
  }
}
