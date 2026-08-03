import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class NetworkInfo {
  final Connectivity _connectivity;

  const NetworkInfo(this._connectivity);

  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map(
      (result) => !result.contains(ConnectivityResult.none),
    );
  }
}