import 'package:get/get.dart';

void showMessage(String message, {int seconds = 1}){
  Get.showSnackbar(GetBar(
    message: message,
    duration: Duration(seconds: seconds),
  ));
}
