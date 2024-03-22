import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String profile;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.profile,
  });

  const User.empty()
      : id = "",
        name = "",
        email = "",
        profile = "";

  User copyWith({String? id, String? name, String? email, String? profile}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        profile,
      ];
}
