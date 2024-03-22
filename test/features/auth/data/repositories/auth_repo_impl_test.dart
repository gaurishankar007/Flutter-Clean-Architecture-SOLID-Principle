import 'package:boilerplate/core/resources/data_state.dart';
import 'package:boilerplate/core/services/network_status.dart';
import 'package:boilerplate/features/auth/data/dataSources/auth_local_data_source.dart';
import 'package:boilerplate/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:boilerplate/features/auth/data/models/user_data_model.dart';
import 'package:boilerplate/features/auth/data/models/user_model.dart';
import 'package:boilerplate/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:boilerplate/features/auth/domain/entities/user_data.dart';
import 'package:boilerplate/features/auth/domain/forms/sign_in_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRemoteDataSourceMock extends Mock implements AuthRemoteDataSource {}

class AuthLocalDataSourceMock extends Mock implements AuthLocalDataSource {}

class NetworkStatusMock extends Mock implements NetworkStatus {}

void main() {
  late final AuthLocalDataSourceMock authLocalDataSourceMock;
  late final AuthRemoteDataSourceMock authRemoteDataSourceMock;
  late final NetworkStatusMock networkStatusMock;
  late final AuthRepositoryImplementation authRepositoryImplementation;
  late final UserData userData;
  late final UserDataModel userDataModel;

  setUpAll(() {
    authLocalDataSourceMock = AuthLocalDataSourceMock();
    authRemoteDataSourceMock = AuthRemoteDataSourceMock();
    networkStatusMock = NetworkStatusMock();
    authRepositoryImplementation = AuthRepositoryImplementation(
      localDataSource: authLocalDataSourceMock,
      remoteDataSource: authRemoteDataSourceMock,
      networkStatus: networkStatusMock,
    );

    userDataModel = const UserDataModel(
      user: UserModel(
        id: "698sdd",
        name: "name",
        email: "email@.com",
        profile: "profile.png",
      ),
      accessToken: "accessToken",
      refreshToken: "refreshToken",
    );
    userData = userDataModel;
  });

  group("Should pass", () {
    SignInForm form = const SignInForm(email: "user", password: "pwd");

    test("Should check if the device is online", () {
      /// Arrange
      when(() => networkStatusMock.isOnline).thenAnswer((_) => true);

      /// Act
      final result = networkStatusMock.isOnline;

      /// Assert
      expect(result, true);
    });

    group("When device is online", () {
      setUp(() {
        when(() => networkStatusMock.isOnline).thenAnswer((_) => true);
        registerFallbackValue(form);
        registerFallbackValue(userData);
      });

      test("Should return a userData when user signs in", () async {
        /// Arrange
        when(() => authRemoteDataSourceMock.signIn(any()))
            .thenAnswer((_) async => DataSuccess(data: userDataModel));
        when(() => authLocalDataSourceMock.saveUserData(any()))
            .thenAnswer((_) async => const DataSuccess(data: true));

        /// act
        final result = await authRepositoryImplementation.signIn(form);

        /// Assert
        verify(() => authRemoteDataSourceMock.signIn(form)).called(1);
        verify(() => authLocalDataSourceMock.saveUserData(userData)).called(1);
        expect(result, DataSuccess(data: userDataModel));
        verifyNever(() => authRemoteDataSourceMock.signIn(form));
      });
    });

    group("When device is offline", () {
      setUp(() {
        when(() => networkStatusMock.isOnline).thenAnswer((_) => false);
        registerFallbackValue(form);
      });

      test("Should return network failure when user signs in", () async {
        /// Arrange

        /// act
        final result = await authRepositoryImplementation.signIn(form);

        /// Assert
        expect(result, const DataNetworkFailure<UserData>());
        verifyNever(() => authRemoteDataSourceMock.signIn(form));
        verifyNever(() => authLocalDataSourceMock.saveUserData(userData));
      });

      test("Should return a userData  when user signs in", () async {
        /// Arrange
        when(() => authLocalDataSourceMock.getUserData())
            .thenAnswer((_) async => DataSuccess(data: userData));

        /// act
        final result = await authRepositoryImplementation.getUserData();

        /// Assert
        verify(() => authLocalDataSourceMock.getUserData()).called(1);
        expect(result, DataSuccess(data: userData));
        verifyNever(() => authRepositoryImplementation.getUserData());
      });
    });
  });
}
