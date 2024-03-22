import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.profile,
  });

  factory UserModel.fromJson(dynamic value) =>
      value is String ? UserModel.fromIdOnly(value) : UserModel.fromJsonOnly(value);

  factory UserModel.fromIdOnly(String id) => UserModel(id: id, name: "", email: "", profile: "");

  factory UserModel.fromJsonOnly(Map<String, dynamic> json) => UserModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        profile: json['profile'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'name': name,
        'email': email,
        'profile': profile,
      };
}
