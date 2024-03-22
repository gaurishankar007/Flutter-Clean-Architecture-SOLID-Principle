import '../../domain/entities/user_data.dart';
import 'user_model.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    required super.user,
    required super.accessToken,
    required super.refreshToken,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        user: UserModel.fromJson(json['user']),
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'user': user,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };
}
