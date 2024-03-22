import 'package:boilerplate/features/auth/data/models/user_model.dart';
import 'package:boilerplate/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const UserModel user = UserModel(
    id: "698sdd",
    name: "name",
    email: "email@.com",
    profile: "profile.png",
  );

  test("Should be a subclass of user entity", () {
    expect(user, isA<User>());
  });
  group("Should return a valid", () {
    test("model from a valid json", () {
      /// Arrange
      Map<String, dynamic> json = {
        "_id": "698sdd",
        "name": "name",
        "email": "email@.com",
        "profile": "profile.png",
      };

      /// Act
      final model = UserModel.fromJson(json);

      /// Assert
      expect(model, user);
    });

    test("json from it", () {
      /// Arrange

      /// Act
      final result = user.toJson();

      /// Assert
      final expectedMap = {
        "_id": "698sdd",
        "name": "name",
        "email": "email@.com",
        "profile": "profile.png",
      };
      expect(result, expectedMap);
    });
  });
}
