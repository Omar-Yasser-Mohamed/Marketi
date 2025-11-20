import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityHelper {
  final connectivity = Connectivity();

  Future<bool> isConnect() async {
    final result = await connectivity.checkConnectivity();

    if (result.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (result.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (result.contains(ConnectivityResult.ethernet)) {
      return true;
    } else {
      return false;
    }
  }
}
