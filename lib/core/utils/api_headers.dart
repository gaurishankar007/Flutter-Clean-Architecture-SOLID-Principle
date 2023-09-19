import 'package:boilerplate/features/auth/data/models/token_model.dart';
import 'package:boilerplate/injection/injector.dart';

Map<String, String> getHeaders() {
  TokenDataModel tokenDataModel = appData.tokenDataModel;
  String token = tokenDataModel.accessToken;

  return {"Authorization": 'Token $token'};
}
