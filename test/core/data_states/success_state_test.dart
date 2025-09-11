import 'package:clean_architecture/core/data_states/data_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SuccessState', () {
    test('should have correct data and hasData true', () {
      final state = SuccessState<int>(
        data: 10,
        message: 'Success',
        statusCode: 200,
      );

      expect(state.data, 10);
      expect(state.message, 'Success');
      expect(state.statusCode, 200);
      expect(state.hasData, true);
      expect(state.hasError, false);
    });

    test('should be equatable', () {
      final state1 = SuccessState<int>(data: 1, message: 'ok', statusCode: 200);
      final state2 = SuccessState<int>(data: 1, message: 'ok', statusCode: 200);

      expect(state1, equals(state2));
    });
  });
}
