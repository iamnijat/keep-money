import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_service.dart';

class NetworkServiceImpl implements NetworkService {
  final InternetConnectionChecker connectivity;

  NetworkServiceImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await InternetConnectionChecker().hasConnection;

    return connectivityResult == true;
  }
}
