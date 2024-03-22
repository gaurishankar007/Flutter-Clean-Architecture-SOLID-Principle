import '../../features/auth/domain/entities/user.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/data_state.dart';
import '../../features/auth/domain/entities/user_data.dart';
import '../../features/auth/domain/useCases/get_user_data_uc.dart';

/// A class that stores user data
class UserService {
  final GetUserDataUseCase getUserDataUseCase;

  UserService({required this.getUserDataUseCase});

  ThemeMode themeMode = ThemeMode.light;
  bool _isLoggedIn = true;
  UserData userData = const UserData.empty().copyWith(user: User.empty().copyWith(name: "User"));
  initializeUserData() async {
    await getUserData();
  }

  getUserData() async {
    final userDataState = await getUserDataUseCase.call();
    if (userDataState is DataSuccess) userData = userDataState.data!;
    _isLoggedIn = false;
  }

  bool get isLoggedIn => _isLoggedIn;
}
