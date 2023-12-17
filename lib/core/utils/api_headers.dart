import '../../features/auth/data/models/userData/user_data_model.dart';
import '../../injection/injector.dart';

Map<String, String> getHeaders() {
  UserDataModel userDataModel = appData.udm;
  String token = userDataModel.accessToken;

  return {"Authorization": 'Bearer $token'};
}
