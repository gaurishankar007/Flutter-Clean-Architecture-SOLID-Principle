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
  FutureBool removeUserData();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImplementation implements AuthLocalDataSource {
  final LocalDatabaseService _localDatabase;

  const AuthLocalDataSourceImplementation({
    required LocalDatabaseService localDatabase,
  }) : _localDatabase = localDatabase;

  @override
  FutureBool saveUserData(UserData userData) async {
    return ErrorHandler.handleException(() async {
      _localDatabase.setString("userData", jsonEncode(userData.toJson()));
      return const SuccessState(data: true);
    });
  }

  @override
  FutureData<UserDataModel> getUserData() async {
    return ErrorHandler.handleException(() async {
      String userData = await _localDatabase.getString("userData") ?? "";

      if (userData.isNotEmpty) {
        final userDataModel = UserDataModel.fromJson(jsonDecode(userData));
        return SuccessState(data: userDataModel);
      }

      return const FailureState<UserDataModel>(message: "User data not found.");
    });
  }

  @override
  FutureBool removeUserData() {
    return ErrorHandler.handleException(() async {
      await _localDatabase.remove("userData");
      return const SuccessState(data: true);
    });
  }
}
