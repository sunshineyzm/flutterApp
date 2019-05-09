import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static showToastMsg(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      // backgroundColor: Colors.white,
      // textColor: Colors.white,
      timeInSecForIos: 1
    );
  }
}