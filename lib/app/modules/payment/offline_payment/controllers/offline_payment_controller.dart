import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rentpro/app/modules/payment/offline_payment/views/status_view.dart';

class OfflinePaymentController extends GetxController {
  TextEditingController timePickerController = TextEditingController();
  TextEditingController datePickerController = TextEditingController();

  void handleSubmitButton() {
    if (timePickerController.text.isNotEmpty &&
        datePickerController.text.isNotEmpty) {
      Get.to(
        () => AcnooPaymentStatusView(
          status: true,
        ),
      );
    } else {
      Get.to(
        () => AcnooPaymentStatusView(
          status: false,
        ),
      );
    }
  }

  //Date Picker
  void pickDate() {
    showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((selectedDate) {
      if (selectedDate != null) {
        String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
        datePickerController.text = formattedDate;
        update();
      }
    });
  }

  //Time Picker
  void pickTime() {
    showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    ).then((selectedTime) {
      if (selectedTime != null) {
        String formattedTime = DateFormat.jm().format(
            DateTime(2023, 1, 1, selectedTime.hour, selectedTime.minute));
        timePickerController.text = formattedTime;
      }
    });
  }
}
