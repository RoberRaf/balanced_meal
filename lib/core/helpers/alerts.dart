import 'package:flutterflow_task/config/theming/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:panara_dialogs/panara_dialogs.dart';

class Alerts {
  static void showToast(
    String message, {
    Toast length = Toast.LENGTH_SHORT,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
    bool error = true,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: toastGravity,
      timeInSecForIosWeb: 3,
      fontSize: 16,
      backgroundColor: Co.white,
      textColor: error ? Co.red : Co.primary,
    );
  }
}
