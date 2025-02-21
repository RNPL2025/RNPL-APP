import 'dart:io';

import 'package:get/get.dart';

import '../../../shared_controller/image_picker_controller.dart';

class UserProfileController extends GetxController {
  final imagePickerController = Get.put(AcnooImagePickerController());

  Rx<File?> profileImage = Rx<File?>(null);
  void getProfileImage(bool isCamera) async {
    profileImage.value = await (isCamera
        ? imagePickerController.cameraImage()
        : imagePickerController.galleryImage());
  }
}
