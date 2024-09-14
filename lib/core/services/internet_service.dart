import 'dart:async' show StreamSubscription;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Check whether the device is online or offline
class InternetService {
  final _internetConnectionChecker = InternetConnectionChecker();
  final _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  bool _connection = true;
  bool get isConnected => _connection;

  Future<bool> checkConnection() async =>
      await _internetConnectionChecker.hasConnection;

  /// Checks weather internet is available or not
  /// and listens to the connectivity changes
  checkAndListenConnectivity() async {
    if (_subscription != null) return;

    /// Do manual checking for web version
    _connection = await checkConnection();

    /// Listen to connectivity changes
    _subscription =
        _connectivity.onConnectivityChanged.listen((statusList) async {
      bool connected = statusList.contains(ConnectivityResult.mobile) ||
          statusList.contains(ConnectivityResult.wifi);
      _connection = connected ? await checkConnection() : false;
    });
  }

  /// Stop listening to the connectivity changes
  cancelSubscription() => _subscription?.cancel();
}
