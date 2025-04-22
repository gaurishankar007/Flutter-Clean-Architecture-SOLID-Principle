import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../config/routes/routes.gr.dart';
import '../../../features/auth/data/data_sources/auth_local_data_source.dart';
import '../../../features/auth/data/models/user_data_model.dart';
import '../../../features/auth/domain/entities/user_data.dart';
import '../navigation/navigation_service.dart';

abstract class SessionManager {
  bool get isLoggedIn;
  UserData get userData;
  String get refreshToken;
  String get accessToken;
  String get fullName;
  checkForUserCredential();
  set setUserData(UserData model);
  storeUserCredential(UserDataModel userData);
  refreshAccessToken(String accessToken);
  clearSessionData();
}

/// A class that stores user data
@LazySingleton(as: SessionManager)
class SessionManagerImplementation implements SessionManager {
  final AuthLocalDataSource _authLocalDataSource;
  final NavigationService _navigationService;

  SessionManagerImplementation({
    required AuthLocalDataSource authLocalDataSource,
    required NavigationService navigationService,
  })  : _authLocalDataSource = authLocalDataSource,
        _navigationService = navigationService;

  UserData _userData = const UserData.empty();

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

  /// Check user's logged in credentials and store it before starting the app
  @override
  checkForUserCredential() async {
    final dataState = await _authLocalDataSource.getUserData();
    if (dataState.hasData) _userData = dataState.data!;
  }

  @override
  set setUserData(UserData model) => _userData = model;

  /// Store user's logged in credentials
  @override
  storeUserCredential(UserDataModel userData) async {
    setUserData = userData;
    await _authLocalDataSource.saveUserData(_userData);
  }

  /// Store new access token if it is expired.
  @override
  refreshAccessToken(String accessToken) async {
    setUserData = _userData.copyWith(accessToken: accessToken);
    await _authLocalDataSource.saveUserData(_userData);
  }

  @override
  clearSessionData() {
    _userData = const UserData.empty();
    _authLocalDataSource.removeUserData();
    _navigationService.replaceAllRoute(const LoginRoute());
  }
}

/// A util class for accessing [SessionManager]
class SessionManagerUtil {
  SessionManagerUtil._();

  /// Returns the registered instance of [SessionManager] which is always the same
  static SessionManager get I => GetIt.I<SessionManager>();
}
