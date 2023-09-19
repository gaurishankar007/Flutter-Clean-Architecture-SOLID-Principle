import 'package:boilerplate/features/auth/domain/entities/token_entity.dart';

class TokenDataModel extends TokenData {
  const TokenDataModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory TokenDataModel.empty() => TokenDataModel(
        accessToken: "",
        refreshToken: "",
      );
}
