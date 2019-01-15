import 'package:toast/toast.dart';

class Util{
  static void showToast(String msg,context,{int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: Toast.BOTTOM);
  }
}