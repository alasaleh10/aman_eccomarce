import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> isConnection() async {
  // return false;
  if (await InternetConnectionChecker().hasConnection) {
    return true;
  } else {
    return false;
  }
}
