import 'dart:async';

class DebounceTime {
  final Duration delay;
  Timer? _timer;

  DebounceTime({
    required this.delay,
  });

  void run(Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() => _timer?.cancel();
}
