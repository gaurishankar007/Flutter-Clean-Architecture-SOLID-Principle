import 'dart:io';

import 'core/overrides/http_override.dart';
import 'core/resources/data_state.dart';
import 'features/auth/data/models/logData/log_data_model.dart';
import 'features/auth/data/models/userData/user_data_model.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'injection/injector.dart';

class AppData {
  AppData._();
  static final AppData _singleton = AppData._();
  factory AppData() => _singleton;

  bool _initialized = false;
  UserDataModel _userDataModel = UserDataModel.empty();
  LogDataModel _logDataModel = LogDataModel.empty();
  String _fyId = "";

  Future init() async {
    if (_initialized) return;
    _initialized = true;

    HttpOverrides.global = MyHttpOverrides();
    initializeDependencies();

    await network.listen();
    await _checkLogin();
  }

  _checkLogin() async {
    final userData = await getUserDataUC.call();
    final logData = await getLogDataUC.call();

    if (userData is SuccessState) _userDataModel = userData.data!;
    if (logData is SuccessState) _logDataModel = logData.data!;
  }

  set setUserModel(UserDataModel userModel) => _userDataModel = userModel;
  set setLogDataModel(LogDataModel logModel) => _logDataModel = logModel;
  set setFyId(String fyId) => _fyId = fyId;
  UserDataModel get udm => _userDataModel;
  LogDataModel get logDataModel => _logDataModel;
  String get fyId => _fyId;

  Future<DataState<String>> refreshToken() async {
    final dState = await getRefreshTokenUC.call();

    if (dState is SuccessState) {
      _userDataModel = _userDataModel.copyWith(accessToken: dState.data!);
    } else if (dState is FailureState && dState.errorType == ErrorType.tokenExpired) {
      getIt<AuthCubit>().logOut();
    }

    return dState;
  }

  removeUserModel() => _userDataModel = UserDataModel.empty();
}
