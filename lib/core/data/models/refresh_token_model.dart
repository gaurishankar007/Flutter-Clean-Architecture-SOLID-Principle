class RefreshTokenModel {
  final String accessToken;

  const RefreshTokenModel({
    required this.accessToken,
  });

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) =>
      RefreshTokenModel(accessToken: json["access"] as String);
}
