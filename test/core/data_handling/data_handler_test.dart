import 'package:clean_architecture/core/data_handling/data_handler.dart';
import 'package:clean_architecture/core/data_states/data_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

class MockResponse extends Mock implements Response {}

void main() {
  group('DataHandler.fetchWithFallback', () {
    test('returns remote data when online', () async {
      final result = await DataHandler.fetchWithFallback<int>(
        true,
        remoteCallback: () async => SuccessState(data: 42),
      );
      expect(result, isA<SuccessState<int>>());
      expect(result.data, 42);
    });

    test('calls onRemoteSuccess when data is present', () async {
      int? callbackValue;
      await DataHandler.fetchWithFallback<int>(
        true,
        remoteCallback: () async => SuccessState(data: 99),
        onRemoteSuccess: (data) => callbackValue = data,
      );
      expect(callbackValue, 99);
    });

    test('does not call onRemoteSuccess when data is null', () async {
      bool wasCalled = false;
      await DataHandler.fetchWithFallback<int>(
        true,
        remoteCallback: () async => SuccessState(data: null),
        onRemoteSuccess: (data) => wasCalled = true,
      );
      expect(wasCalled, false);
    });

    test('returns local data when offline and localCallback is provided', () async {
      final result = await DataHandler.fetchWithFallback<String>(
        false,
        remoteCallback: () async => SuccessState(data: 'remote'),
        localCallback: () async => SuccessState(data: 'local'),
      );
      expect(result, isA<SuccessState<String>>());
      expect(result.data, 'local');
    });

    test('returns NoInternetState when offline and no localCallback', () async {
      final result = await DataHandler.fetchWithFallback<double>(
        false,
        remoteCallback: () async => SuccessState(data: 1.0),
      );
      expect(result.errorType, ErrorType.internetError);
    });

    test('returns remote failure state when remote call fails', () async {
      final result = await DataHandler.fetchWithFallback<String>(
        true,
        remoteCallback: () async => FailureState(message: 'Remote error'),
      );
      expect(result, isA<FailureState<String>>());
      expect(result.message, 'Remote error');
    });
  });

  group('DataHandler.fetchWithFallbackAndMap', () {
    test('maps remote data successfully when online', () async {
      final result = await DataHandler.fetchWithFallbackAndMap<int, String>(
        true,
        remoteCallback: () async => SuccessState(data: 42),
        toDomain: (data) => data.toString(),
      );
      expect(result, isA<SuccessState<String>>());
      expect(result.data, '42');
    });

    test('calls onRemoteSuccess with raw data before mapping', () async {
      int? rawData;
      final result = await DataHandler.fetchWithFallbackAndMap<int, String>(
        true,
        remoteCallback: () async => SuccessState(data: 99),
        toDomain: (data) => data.toString(),
        onRemoteSuccess: (data) => rawData = data,
      );
      expect(rawData, 99);
      expect(result.data, '99');
    });

    test('maps local data when offline', () async {
      final result = await DataHandler.fetchWithFallbackAndMap<int, String>(
        false,
        remoteCallback: () async => SuccessState(data: 100),
        toDomain: (data) => 'Mapped: $data',
        localCallback: () async => SuccessState(data: 50),
      );
      expect(result, isA<SuccessState<String>>());
      expect(result.data, 'Mapped: 50');
    });

    test('returns failure state when both remote and local fail', () async {
      final result = await DataHandler.fetchWithFallbackAndMap<int, String>(
        false,
        remoteCallback: () async => FailureState(message: 'Remote error'),
        toDomain: (data) => data.toString(),
        localCallback: () async => FailureState(message: 'Local error'),
      );
      expect(result, isA<FailureState<String>>());
      expect(result.message, 'Local error');
    });
  });

  group('DataHandler.fetchFromLocalAndMap', () {
    test('maps local data successfully', () async {
      final result = await DataHandler.fetchFromLocalAndMap<int, String>(
        localCallback: () async => SuccessState(data: 123),
        toDomain: (data) => 'Local: $data',
      );
      expect(result, isA<SuccessState<String>>());
      expect(result.data, 'Local: 123');
    });

    test('propagates local failure state', () async {
      final result = await DataHandler.fetchFromLocalAndMap<int, String>(
        localCallback: () async => FailureState(message: 'Local storage error'),
        toDomain: (data) => data.toString(),
      );
      expect(result, isA<FailureState<String>>());
      expect(result.message, 'Local storage error');
    });
  });

  group('DataHandler.safeApiCall', () {
    test('returns SuccessState on valid standard response', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn({
        'data': {'id': 1},
        'message': 'ok',
      });
      when(() => mockResponse.statusCode).thenReturn(200);

      final result = await DataHandler.safeApiCall<Map<String, dynamic>, Map<String, dynamic>>(
        request: () async => mockResponse,
        fromJson: (json) => json,
      );

      expect(result, isA<SuccessState<Map<String, dynamic>>>());
      expect(result.data, {'id': 1});
      expect(result.message, 'ok');
      expect(result.statusCode, 200);
    });

    test('returns FailureState on missing data key in standard response', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn({'foo': 'bar'});
      when(() => mockResponse.statusCode).thenReturn(200);

      final result = await DataHandler.safeApiCall<Map<String, dynamic>, Map<String, dynamic>>(
        request: () async => mockResponse,
        fromJson: (json) => json,
      );

      expect(result, isA<FailureState<Map<String, dynamic>>>());
      expect(result.errorType, ErrorType.responseError);
    });

    test('handles static data return with useStaticDataAsNull = true', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn({'data': 'ignored'});
      when(() => mockResponse.statusCode).thenReturn(200);

      final result = await DataHandler.safeApiCall<String, String>(
        request: () async => mockResponse,
        staticData: null,
        useStaticDataAsNull: true,
      );

      expect(result, isA<SuccessState<String>>());
      expect(result.data, null);
    });

    test('handles static data return with useStaticDataAsNull = false', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn({'data': 'from_api'});
      when(() => mockResponse.statusCode).thenReturn(200);

      final result = await DataHandler.safeApiCall<String, String>(
        request: () async => mockResponse,
        staticData: 'static_value',
        useStaticDataAsNull: false,
      );

      expect(result, isA<SuccessState<String>>());
      expect(result.data, 'static_value');
    });

    test('handles list deserialization correctly', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn({
        'data': [
          {'id': 1},
          {'id': 2}
        ],
        'message': 'list ok',
      });
      when(() => mockResponse.statusCode).thenReturn(200);

      final result = await DataHandler.safeApiCall<List<Map<String, dynamic>>, Map<String, dynamic>>(
        request: () async => mockResponse,
        fromJson: (json) => json,
      );

      expect(result, isA<SuccessState<List<Map<String, dynamic>>>>());
      expect(result.data, [
        {'id': 1},
        {'id': 2}
      ]);
      expect(result.message, 'list ok');
    });

    test('returns format error for unexpected response type', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn('invalid_string_data');
      when(() => mockResponse.statusCode).thenReturn(200);

      final result = await DataHandler.safeApiCall<Map<String, dynamic>, Map<String, dynamic>>(
        request: () async => mockResponse,
        fromJson: (json) => json,
      );

      expect(result, isA<FailureState<Map<String, dynamic>>>());
      expect(result.errorType, ErrorType.responseError);
    });

    test('handles non-standard response structure', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn({'id': 1, 'name': 'test'});
      when(() => mockResponse.statusCode).thenReturn(200);

      final result = await DataHandler.safeApiCall<Map<String, dynamic>, Map<String, dynamic>>(
        request: () async => mockResponse,
        fromJson: (json) => json,
        isStandardResponse: false,
      );

      expect(result, isA<SuccessState<Map<String, dynamic>>>());
      expect(result.data, {'id': 1, 'name': 'test'});
    });

    test('handles raw data without deserialization', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn('raw_string');
      when(() => mockResponse.statusCode).thenReturn(200);

      final result = await DataHandler.safeApiCall<String, String>(
        request: () async => mockResponse,
        isStandardResponse: false,
      );

      expect(result, isA<SuccessState<String>>());
      expect(result.data, 'raw_string');
    });

    test('returns type mismatch error for incompatible types', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.data).thenReturn({'id': 1});
      when(() => mockResponse.statusCode).thenReturn(200);

      final result = await DataHandler.safeApiCall<String, String>(
        request: () async => mockResponse,
        isStandardResponse: false,
      );

      expect(result, isA<FailureState<String>>());
      expect(result.errorType, ErrorType.formatError);
    });
  });
}