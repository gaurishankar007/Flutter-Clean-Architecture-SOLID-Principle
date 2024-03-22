import 'package:boilerplate/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final User user;

  setUpAll(() {
    user = const User(
      id: "",
      name: "",
      email: "",
      profile: "",
    );
  });

  test("Should return user with empty value", () {
    /// Arrange

    /// Act
    const result = User.empty();

    /// Assert
    expect(result, user);
  });

  test("Should return a new user with some changes in value", () {
    /// Arrange

    /// Act
    final result = user.copyWith(
      id: "123",
      name: "Abc",
    );

    /// Assert
    expect(result, const User(id: "123", name: "Abc", email: "", profile: ""));
  });
}
