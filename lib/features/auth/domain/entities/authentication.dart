class Authentication {
  final String username;
  final String password;
  final String fcmToken;
  final String deviceType;

  const Authentication({
    required this.username,
    required this.password,
    this.fcmToken = "",
    this.deviceType = "",
  });

  Authentication copyWith({
    required String fmcToken,
    required String deviceType,
  }) =>
      Authentication(
        username: username,
        password: password,
        fcmToken: fmcToken,
        deviceType: deviceType,
      );

  @override
  bool operator ==(covariant Authentication other) {
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
