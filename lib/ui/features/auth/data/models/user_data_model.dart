import '../../domain/entities/user_data.dart';
import '../../../../../core/data/models/user_model.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    required super.user,
    required super.accessToken,
    required super.refreshToken,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      user: UserModel.fromJson(json['user'] ?? {}),
      accessToken: json['access'] ?? "",
      refreshToken: json['refresh'] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        user,
        accessToken,
        refreshToken,
      ];
}
