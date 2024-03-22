import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/core/services/local_database.dart';
import 'package:boilerplate/features/auth/data/dataSources/auth_local_data_source.dart';
import 'package:boilerplate/features/auth/data/isarCollections/userData/user_data_collection.dart';
import 'package:boilerplate/features/auth/domain/entities/user.dart';
import 'package:boilerplate/features/auth/domain/entities/user_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalDatabaseMock extends Mock implements LocalDatabase {}

void main() {
  late final LocalDatabaseMock localDatabaseMock;
  late final AuthLocalDataSourceImplementation authLocalDataSourceImplementation;

  setUpAll(() {
    localDatabaseMock = LocalDatabaseMock();
    authLocalDataSourceImplementation =
        AuthLocalDataSourceImplementation(localDatabase: localDatabaseMock);
  });

  group("User Data", () {
    late UserData userData;
    late UserDataCollection userDataCollection;
    late List<UserDataCollection> userDataCollections;

    setUp(() {
      userData = const UserData(
        user: User(id: "userId", name: "userName", email: "userEmail", profile: "userProfile"),
        accessToken: "accessToken",
        refreshToken: "refreshToken",
      );
      userDataCollection = UserDataCollection.fromUserData(userData);
      userDataCollections = [userDataCollection];
    });

    test("Should return true after saving user data", () async {
      /// Arrange
      when(() => localDatabaseMock.save(userDataCollection)).thenAnswer((_) async => true);

      /// Act
      final result = await authLocalDataSourceImplementation.saveUserData(userData);

      /// Assert
      verify(() => localDatabaseMock.save(userDataCollection)).called(1);
      expect(result, const DataSuccess(data: true));
    });

    test("Should return user data from local database", () async {
      /// Arrange
      when(() => localDatabaseMock.getAll<UserDataCollection>())
          .thenAnswer((_) async => userDataCollections);

      /// Act
      final result = await authLocalDataSourceImplementation.getUserData();

      /// Assert
      verify(() => localDatabaseMock.getAll<UserDataCollection>()).called(1);
      expect(result, DataSuccess(data: userData));
    });
  });
}
