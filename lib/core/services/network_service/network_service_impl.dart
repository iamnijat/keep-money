import 'package:connectivity_plus/connectivity_plus.dart';

import 'network_service.dart';

class NetworkServiceImpl implements NetworkService {
  final Connectivity connectivity;

  NetworkServiceImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await connectivity.checkConnectivity();

    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
