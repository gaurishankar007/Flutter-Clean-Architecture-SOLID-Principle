import '../../injector/injector.dart';

Map<String, String> reqHeaders({bool isFormData = false}) {
  String accessToken = userService.userData.accessToken;
  Map<String, String> header = {
    "Authorization": "Bearer $accessToken",
    "Content-Type": isFormData ? "multipart/form-data" : "application/json"
  };

  return header;
}
