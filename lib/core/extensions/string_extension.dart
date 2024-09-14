import 'package:flutter/foundation.dart';

extension StringExtension on String {
  String? get debugOnly => kDebugMode ? this : null;
}
