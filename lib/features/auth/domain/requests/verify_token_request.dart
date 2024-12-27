class VerifyTokenRequest {
  final String token;
  final String userId;

  const VerifyTokenRequest({
    required this.token,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_id": userId,
      };
}
