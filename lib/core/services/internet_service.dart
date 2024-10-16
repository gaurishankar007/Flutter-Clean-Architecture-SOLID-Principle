import 'dart:async' show StreamSubscription;

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// Check whether the device is online or offline
class InternetService {
  final _internetConnection = InternetConnection();
  StreamSubscription<InternetStatus>? _subscription;
  bool _connection = true;
  bool get isConnected => _connection;
  StreamSubscription<InternetStatus>? get subscription => _subscription;

  Future<bool> checkConnection() async =>
      await _internetConnection.hasInternetAccess;

  /// Checks weather internet is available or not
  /// and listens to the connectivity changes
  checkAndListenConnectivity() async {
    if (_subscription != null) return;

    /// Listen to connectivity changes
    _subscription = _internetConnection.onStatusChange.listen((status) async {
      _connection = await checkConnection();
    });
  }

  /// Stop listening to the connectivity changes
  cancelSubscription() => _subscription?.cancel();
}

/// A util class for accessing [InternetService]
class InternetUtil {
  InternetUtil._();

  /// Returns the registered instance of [InternetService] which is always the same
  static InternetService get I => GetIt.I<InternetService>();
}
