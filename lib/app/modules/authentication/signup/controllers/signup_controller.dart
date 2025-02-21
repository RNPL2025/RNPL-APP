import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/user/demo_user_data.dart';

class SignupController extends GetxController {
  final FocusNode formFocusNode = FocusNode();
  final userController = Get.put(AcnooCurrentUser());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signupFunc() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      userController.currentUser.value = AcnooDemoUserModel(
        fullName: nameController.text,
        email: emailController.text,
      );
      Get.offAndToNamed('/setup-profile');
    } else {
      userController.currentUser.value = AcnooDemoUserModel();
    }
    //TODO:Fix condition
    Get.offAndToNamed('/setup-profile');
  }

  RxBool formFocus = false.obs;
  RxBool obscureText = true.obs;
  RxBool rememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
    formFocusNode.addListener(
        () => formFocus.value = formFocusNode.hasFocus ? true : false);
  }
}
