import 'dart:async' show StreamSubscription;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Check whether the device is online or offline
class NetworkStatus {
  final InternetConnectionChecker internetConnectionChecker;
  final Connectivity connectivity;

  NetworkStatus({required this.internetConnectionChecker, required this.connectivity});

  StreamSubscription<ConnectivityResult>? _subscription;
  bool _online = true;
  bool get isOnline => _online;

  Future<bool> checkConnection() async => await internetConnectionChecker.hasConnection;

  /// Checks weather internet is available or not and listens to the connectivity changes
  checkConnectionAndListenConnectivity() async {
    if (_subscription != null) return;

    /// Do manual checking for web version
    _online = await checkConnection();

    /// Listen to connectivity changes
    _subscription = connectivity.onConnectivityChanged.listen((status) async {
      if (status != ConnectivityResult.none) {
        _online = await checkConnection();
      } else {
        _online = false;
      }
    });
  }

  /// Stop listening to the connectivity changes
  cancelSubscription() {
    if (_subscription != null) _subscription!.cancel();
  }
}
