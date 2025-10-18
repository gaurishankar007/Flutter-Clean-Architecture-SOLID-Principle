class RefreshTokenResponse {
  final String accessToken;

  const RefreshTokenResponse({required this.accessToken});

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponse(accessToken: json["access"] as String);
}
