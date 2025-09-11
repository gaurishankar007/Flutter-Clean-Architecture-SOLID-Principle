import '../../../domain/entities/authentication.dart';

class AuthenticationRequest {
  final String username;
  final String password;
  final String fcmToken;
  final String deviceType;

  const AuthenticationRequest({
    required this.username,
    required this.password,
    this.fcmToken = "",
    this.deviceType = "",
  });

  factory AuthenticationRequest.fromDomain(Authentication authentication) =>
      AuthenticationRequest(
        username: authentication.username,
        password: authentication.password,
      );

  Map<String, String> toJson() => {
        "username": username,
        "password": password,
        "fcm_token": fcmToken,
        "device_type": deviceType,
      };
}
