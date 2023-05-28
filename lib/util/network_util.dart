import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  static final Connectivity _connectivity = Connectivity();

  static Future<bool> isOnline() async{
    final result = await _connectivity.checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet ||
        result == ConnectivityResult.vpn) {
      return Future.value(true);
    }
    return Future.value(false);
  }

}
