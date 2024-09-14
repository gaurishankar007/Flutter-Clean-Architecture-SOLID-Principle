class VerificationParameter {
  final int isVerified;

  const VerificationParameter.verified() : isVerified = 1;

  const VerificationParameter.unverified() : isVerified = 0;

  Map<String, int> toJson() => {'is_verified': isVerified};
}
