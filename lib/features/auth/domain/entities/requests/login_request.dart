class LoginRequest {
  final String username;
  final String password;
  final String fcmToken;
  final String deviceType;

  const LoginRequest({
    required this.username,
    required this.password,
    this.fcmToken = "",
    this.deviceType = "",
  });

  LoginRequest copyWith({
    required String fmcToken,
    required String deviceType,
  }) =>
      LoginRequest(
        username: username,
        password: password,
        fcmToken: fmcToken,
        deviceType: deviceType,
      );

  Map<String, String> toJson() => {
        "username": username,
        "password": password,
        "fcm_token": fcmToken,
        "device_type": deviceType,
      };

  @override
  bool operator ==(covariant LoginRequest other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.fcmToken == fcmToken &&
        other.deviceType == deviceType;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        fcmToken.hashCode ^
        deviceType.hashCode;
  }
}
