import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/models/user_data_model.dart';
import '../../features/auth/domain/entities/user_data.dart';
import 'local_database_service.dart';
import 'navigation/navigation_service.dart';

abstract class UserDataService {
  checkForUserCredential();
  set setUserData(UserData model);
  storeUserCredential(UserDataModel userData);
  refreshAccessToken(String accessToken);
  logOut();
  bool get isLoggedIn;
  UserData get userData;
  String get refreshToken;
  String get accessToken;
  String get fullName;
}

/// A class that stores user data
@LazySingleton(as: UserDataService)
class UserDataServiceImplementation implements UserDataService {
  final LocalDatabaseService localDatabase;
  final NavigationService navigationService;

  UserDataServiceImplementation({
    required this.localDatabase,
    required this.navigationService,
  });

  UserData _userData = const UserData.empty();

  /// Check user's logged in credentials and store it before starting the app
  @override
  checkForUserCredential() async {
    try {
      String userData = await localDatabase.getString("userData") ?? "";
      if (userData.isEmpty) return;
      setUserData = UserDataModel.fromJson(jsonDecode(userData));
    } catch (_) {}
  }

  @override
  set setUserData(UserData model) => _userData = model;

  /// Store user's logged in credentials
  @override
  storeUserCredential(UserDataModel userData) async {
    setUserData = userData;
    final data = jsonEncode(userData.toJson());
    await localDatabase.setString("userData", data);
  }

  /// Store new access token if it is expired.
  @override
  refreshAccessToken(String accessToken) async {
    setUserData = _userData.copyWith(accessToken: accessToken);
    final data = jsonEncode(userData.toJson());
    await localDatabase.setString("userData", data);
  }

  @override
  logOut() async {
    localDatabase.clear();
    _userData = const UserData.empty();
    navigationService.replaceRoute(LOGIN_PATH);
  }

  @override
  bool get isLoggedIn => _userData.accessToken.isNotEmpty;
  @override
  UserData get userData => _userData;
  @override
  String get refreshToken => _userData.refreshToken;
  @override
  String get accessToken => _userData.accessToken;
  @override
  String get fullName =>
      "${_userData.user.firstName} ${_userData.user.lastName}";
}

/// A util class for accessing [UserDataService]
class UserDataUtil {
  UserDataUtil._();

  /// Returns the registered instance of [UserDataService] which is always the same
  static UserDataService get I => GetIt.I<UserDataService>();
}
