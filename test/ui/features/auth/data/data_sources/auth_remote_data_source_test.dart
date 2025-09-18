import 'package:clean_architecture/core/constants/api_endpoints.dart';
import 'package:clean_architecture/core/data_states/data_state.dart';
import 'package:clean_architecture/ui/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:clean_architecture/ui/features/auth/data/models/requests/authentication_request.dart';
import 'package:clean_architecture/ui/features/auth/data/models/user_data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../testing/mocks/service_mocks.dart';

// A mock for Options is needed for `captureAny` with mocktail
class MockOptions extends Mock implements Options {}

void main() {
  late MockApiService mockApiService;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiService = MockApiService();
    dataSource = AuthRemoteDataSourceImpl(dioClient: mockApiService);
    registerFallbackValue(MockOptions());
  });

  group('login', () {
    const tAuthenticationRequest = AuthenticationRequest(
      username: 'test',
      password: 'password',
    );

    // Assuming AuthenticationRequest has a toJson method like this
    final tAuthenticationRequestJson = tAuthenticationRequest.toJson();

    final tSuccessResponseJson = {
      "data": {
        "user": {
          "id": 1,
          "first_name": "Test",
          "last_name": "User",
          "username": "testuser",
          "email": "test@example.com",
          "is_active": true,
        },
        "access": "access",
        "refresh": "refresh",
      },
      "message": "Login successful",
    };

    test(
      'should return SuccessState with UserDataModel when API call is successful (200)',
      () async {
        // Arrange
        when(
          () => mockApiService.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: ApiEndpoints.login),
            data: tSuccessResponseJson,
            statusCode: 200,
          ),
        );

        // Act
        final result = await dataSource.login(tAuthenticationRequest);

        // Assert
        expect(result, isA<SuccessState<UserDataModel>>());
        expect(result.data, isNotNull);
        expect(result.data!.user.id, 1);
        expect(result.data!.accessToken, 'access');
        expect(result.data!.refreshToken, 'refresh');

        final captured = verify(
          () => mockApiService.post(
            ApiEndpoints.login,
            data: captureAny(named: 'data'),
            options: captureAny(named: 'options'),
          ),
        ).captured;

        expect(captured[0], tAuthenticationRequestJson);
        final options = captured[1] as Options;
        expect(options.validateStatus!(200), isTrue);
        expect(options.validateStatus!(400), isTrue);
      },
    );

    test('should return FailureState when API returns 400', () async {
      // Arrange
      // This response is missing the 'data' key, which DataHandler will flag as an error.
      final tErrorResponseJson = {"message": "Invalid credentials"};
      when(
        () => mockApiService.post(
          any(),
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ApiEndpoints.login),
          data: tErrorResponseJson,
          statusCode: 400,
        ),
      );

      // Act
      final result = await dataSource.login(tAuthenticationRequest);

      // Assert
      expect(result, isA<FailureState<UserDataModel>>());
    });

    test(
      'should return FailureState when API call throws a DioException',
      () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: ApiEndpoints.login),
          message: 'Connection failed',
        );
        when(
          () => mockApiService.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          ),
        ).thenThrow(dioException);

        // Act
        final result = await dataSource.login(tAuthenticationRequest);

        // Assert
        expect(result, isA<FailureState<UserDataModel>>());
      },
    );
  });

  group('checkAuth', () {
    test(
      'should return SuccessState with true when API call is successful',
      () async {
        // Arrange
        when(() => mockApiService.get(any())).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: ApiEndpoints.checkAuth),
            data: {
              'data': {"ab": true},
              'message': 'Authenticated',
            },
            statusCode: 200,
          ),
        );

        // Act
        final result = await dataSource.checkAUth();

        // Assert
        expect(result, isA<SuccessState<bool>>());
        expect(result.data, isTrue);
        verify(() => mockApiService.get(ApiEndpoints.checkAuth)).called(1);
      },
    );

    test(
      'should return FailureState when API call throws a DioException',
      () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: ApiEndpoints.checkAuth),
          message: 'Not authenticated',
        );
        when(() => mockApiService.get(any())).thenThrow(dioException);

        // Act
        final result = await dataSource.checkAUth();

        // Assert
        expect(result, isA<FailureState<bool>>());
      },
    );
  });
}
