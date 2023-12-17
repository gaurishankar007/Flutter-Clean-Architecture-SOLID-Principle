import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _subscription;
  bool _isConnected = true;
  NetworkService._();

  static final NetworkService _singleton = NetworkService._();
  factory NetworkService() => _singleton;

  bool get isConnected => _isConnected;

  _updateConnectivity(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      _isConnected = true;
    } else {
      _isConnected = false;
    }
  }

  Future listen() async {
    if (_subscription != null) return;

    ConnectivityResult result = await _connectivity.checkConnectivity();
    _updateConnectivity(result);

    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      _updateConnectivity(event);
    });
  }

  cancelListening() {
    if (_subscription == null) return;
    _subscription!.cancel();
  }

  Stream<bool> streamNetworkService(
      StreamController<bool> networkServiceController) async* {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        networkServiceController.add(true);
      }

      networkServiceController.add(false);
    });

    yield* networkServiceController.stream;
  }
}
