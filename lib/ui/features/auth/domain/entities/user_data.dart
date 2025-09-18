import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/user.dart';

class UserData extends Equatable {
  final User user;
  final String accessToken;
  final String refreshToken;

  const UserData({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  const UserData.empty()
      : user = const User.empty(),
        accessToken = "",
        refreshToken = "";

  UserData copyWith({
    User? user,
    String? accessToken,
    String? refreshToken,
  }) {
    return UserData(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'access': accessToken,
        'refresh': refreshToken,
      };

  @override
  List<Object?> get props => [
        user,
        accessToken,
        refreshToken,
      ];
}
