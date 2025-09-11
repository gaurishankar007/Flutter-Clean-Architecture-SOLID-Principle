import 'package:clean_architecture/core/data_states/data_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoadingState', () {
    test('should have hasData and hasError as false', () {
      final state = LoadingState<int>();

      expect(state.hasData, false);
      expect(state.hasError, false);
      expect(state.data, isNull);
      expect(state.message, isNull);
      expect(state.statusCode, isNull);
    });

    test('should be equatable', () {
      final state1 = LoadingState<int>();
      final state2 = LoadingState<int>();

      expect(state1, equals(state2));
    });
  });
}