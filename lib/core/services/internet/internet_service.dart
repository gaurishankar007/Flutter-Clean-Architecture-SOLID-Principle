import 'dart:async' show StreamSubscription;

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class InternetService {
  bool get isConnected;
  Stream<InternetStatus>? get connectivityStream;
  Future<bool> checkConnection();
  subscribeConnectivity();
  unSubscriptionConnectivity();
}

/// Check whether the device is online or offline
@LazySingleton(as: InternetService)
class InternetServiceImplementation implements InternetService {
  final _internetConnection = InternetConnection();
  Stream<InternetStatus>? _connectivityStream;
  StreamSubscription<InternetStatus>? _subscription;
  bool _connection = true;

  @override
  bool get isConnected => _connection;

  @override
  Stream<InternetStatus>? get connectivityStream => _connectivityStream;

  @override
  Future<bool> checkConnection() async =>
      await _internetConnection.hasInternetAccess;

  /// Creates a broadcast stream and updates internet status
  @override
  subscribeConnectivity() {
    /// Broadcasts a stream which can be listen multiple times
    _connectivityStream ??=
        _internetConnection.onStatusChange.asBroadcastStream();

    /// Listen to internet status changes
    _subscription ??= _connectivityStream?.listen(
      (status) async => _connection = await checkConnection(),
    );
  }

  /// Stop listening to the internet status changes
  @override
  unSubscriptionConnectivity() => _subscription?.cancel();
}

/// A util class for accessing [InternetService]
class InternetUtil {
  InternetUtil._();

  /// Returns the registered instance of [InternetService] which is always the same
  static InternetService get I => GetIt.I<InternetService>();
}
