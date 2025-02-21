import 'dart:async';

import 'package:get/get.dart';

class VerificationController extends GetxController {
  RxInt countdownSeconds = RxInt(60);

  void startTimer() {
    const countdownDuration = Duration(minutes: 1);
    countdownSeconds.value = countdownDuration.inSeconds;

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (countdownSeconds.value == 0) {
        timer.cancel(); // Stop the timer when countdown reaches 0
      } else {
        countdownSeconds.value--;
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }
}
