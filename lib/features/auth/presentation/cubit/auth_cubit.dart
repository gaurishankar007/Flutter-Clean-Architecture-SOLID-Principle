import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/route_path.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../injection/injector.dart';
import '../../data/models/logData/log_data_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState?> {
  bool rememberMe = false;
  String userId = "";

  AuthCubit() : super(null);

  rememberUser(bool remember) => rememberMe = remember;

  login(LogDataModel param) async {
    final dState = await loginUC.call(param);

    if (dState is SuccessState) {
      appData.setUserModel = dState.data!;
      appData.setLogDataModel = param.copyWith(rememberMe: rememberMe);

      saveUserDataUC.call(appData.udm);
      if (!appData.logDataModel.biometricEnabled) {
        saveLogDataUC.call(appData.logDataModel);
      }
      return navWithPath(kDashboardP);
    }

    snackBar.snackThis(data: dState);
  }

  logOut() async {
    navWithPath(kLoginP);
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    sharedP.remove("userData");
    appData.removeUserModel();
  }
}
