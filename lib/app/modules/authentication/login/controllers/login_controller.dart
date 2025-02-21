import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  GetStorage box = GetStorage();
  final Map<String, dynamic> args = Get.arguments;
  final FocusNode formFocusNode = FocusNode();

  RxBool formFocus = false.obs;
  RxBool obscureText = true.obs;
  RxBool rememberMe = false.obs;

  void handleLogin(String? user) {
    if (user != null) {
      box.write('user', user);
      Get.offAllNamed('/choose-your-city');
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
    formFocusNode.addListener(
        () => formFocus.value = formFocusNode.hasFocus ? true : false);
  }
}
