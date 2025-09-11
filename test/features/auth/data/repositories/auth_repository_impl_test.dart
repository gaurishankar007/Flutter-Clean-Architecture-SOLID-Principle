import 'package:clean_architecture/core/data_states/data_state.dart';
import 'package:clean_architecture/core/domain/entities/user.dart';
import 'package:clean_architecture/features/auth/data/models/requests/authentication_request.dart';
import 'package:clean_architecture/features/auth/data/models/user_data_model.dart';
import 'package:clean_architecture/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_architecture/features/auth/domain/entities/authentication.dart';
import 'package:clean_architecture/features/auth/domain/entities/user_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_support/mocks/data_sources_mocks.dart';
import '../../../../../test_support/mocks/service_mocks.dart';

void main() {
  late MockInternetService mockInternetService;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late AuthRepositoryImpl repository;

  setUp(() {
    mockInternetService = MockInternetService();
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    repository = AuthRepositoryImpl(
      internet: mockInternetService,
      remoteDataSource: mockAuthRemoteDataSource,
      localDataSource: mockAuthLocalDataSource,
    );

    registerFallbackValue(AuthenticationRequest(username: "", password: ""));
    registerFallbackValue(UserData.empty());
  });

  // Test data
  const tAuthentication = Authentication(
    username: 'test',
    password: 'password',
  );

  const tUser = User(
    id: 1,
    firstName: 'Test',
    lastName: 'User',
    username: 'testuser',
    email: 'test@example.com',
    isActive: true,
  );
  const tUserData = UserData(
    user: tUser,
    accessToken: 'access',
    refreshToken: 'refresh',
  );
  const tUserDataModel = UserDataModel(
    user: tUser,
    accessToken: 'access',
    refreshToken: 'refresh',
  );

  group('login', () {
    test(
      'should call remoteDataSource.login when internet is connected and return its result',
      () async {
        // Arrange
        when(() => mockInternetService.isConnected).thenReturn(true);
        when(
          () => mockAuthRemoteDataSource.login(any()),
        ).thenAnswer((_) async => const SuccessState(data: tUserDataModel));

        // Act
        final result = await repository.login(tAuthentication);

        // Assert
        expect(result, isA<SuccessState<UserData>>());
        expect(result.data, tUserDataModel);
        verify(() => mockInternetService.isConnected).called(1);
        verify(() => mockAuthRemoteDataSource.login(any())).called(1);
        verifyNoMoreInteractions(mockInternetService);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
        verifyZeroInteractions(mockAuthLocalDataSource);
      },
    );

    test(
      'should return FailureState.noInternet when internet is not connected',
      () async {
        // Arrange
        when(() => mockInternetService.isConnected).thenReturn(false);

        // Act
        final result = await repository.login(tAuthentication);

        // Assert
        expect(result, isA<FailureState<UserData>>());
        expect(result.errorType, ErrorType.internetError);
        verify(() => mockInternetService.isConnected).called(1);
        verifyNoMoreInteractions(mockInternetService);
        verifyZeroInteractions(mockAuthRemoteDataSource);
        verifyZeroInteractions(mockAuthLocalDataSource);
      },
    );
  });

  group('saveUserData', () {
    test(
      'should call localDataSource.saveUserData and return its result',
      () async {
        // Arrange
        when(
          () => mockAuthLocalDataSource.saveUserData(any()),
        ).thenAnswer((_) async => const SuccessState(data: true));

        // Act
        final result = await repository.saveUserData(tUserData);

        // Assert
        expect(result, isA<SuccessState<bool>>());
        expect(result.data, true);
        verify(() => mockAuthLocalDataSource.saveUserData(tUserData)).called(1);
        verifyNoMoreInteractions(mockAuthLocalDataSource);
        verifyZeroInteractions(mockInternetService);
        verifyZeroInteractions(mockAuthRemoteDataSource);
      },
    );
  });

  group('getUserData', () {
    test(
      'should call localDataSource.getUserData and return its result',
      () async {
        // Arrange
        when(
          () => mockAuthLocalDataSource.getUserData(),
        ).thenAnswer((_) async => const SuccessState(data: tUserDataModel));

        // Act
        final result = await repository.getUserData();

        // Assert
        expect(result, isA<SuccessState<UserData>>());
        expect(result.data, tUserDataModel);
        verify(() => mockAuthLocalDataSource.getUserData()).called(1);
        verifyNoMoreInteractions(mockAuthLocalDataSource);
        verifyZeroInteractions(mockInternetService);
        verifyZeroInteractions(mockAuthRemoteDataSource);
      },
    );
  });

  group('checkAuth', () {
    test(
      'should call remoteDataSource.checkAUth when internet is connected and return its result',
      () async {
        // Arrange
        when(() => mockInternetService.isConnected).thenReturn(true);
        when(
          () => mockAuthRemoteDataSource.checkAUth(),
        ).thenAnswer((_) async => const SuccessState(data: true));

        // Act
        final result = await repository.checkAuth();

        // Assert
        expect(result, isA<SuccessState<bool>>());
        expect(result.data, true);
        verify(() => mockInternetService.isConnected).called(1);
        verify(() => mockAuthRemoteDataSource.checkAUth()).called(1);
        verifyNoMoreInteractions(mockInternetService);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
        verifyZeroInteractions(mockAuthLocalDataSource);
      },
    );

    test(
      'should return FailureState.noInternet when internet is not connected',
      () async {
        // Arrange
        when(() => mockInternetService.isConnected).thenReturn(false);

        // Act
        final result = await repository.checkAuth();

        // Assert
        expect(result, isA<FailureState<bool>>());
        expect(result.errorType, ErrorType.internetError);
        verify(() => mockInternetService.isConnected).called(1);
        verifyNoMoreInteractions(mockInternetService);
        verifyZeroInteractions(mockAuthRemoteDataSource);
        verifyZeroInteractions(mockAuthLocalDataSource);
      },
    );
  });
}
