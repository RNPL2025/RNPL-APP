import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/onboard_data.dart';

class OnboardingController extends GetxController {
  final PageController imageController = PageController();
  final PageController textController = PageController();
  RxInt currentIndex = 0.obs;

  void handleNextButton() {
    if (currentIndex == AcnooOnboardItems.onboardItems.length - 1) {
      Get.offAndToNamed('/welcome');
    } else {
      imageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      textController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
