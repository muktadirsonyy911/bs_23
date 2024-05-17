import 'package:bs_23/core/utils/logcat.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionService {
  Future<bool> checkInternet() async {
    bool result = await InternetConnectionCheckerPlus().hasConnection;
    if (result == true) {
      Logcat.msg('YAY! Free cute dog pics!');
    } else {
      Logcat.msg('No internet');
    }
    return result;
  }
}
