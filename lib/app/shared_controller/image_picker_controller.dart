import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AcnooImagePickerController extends GetxController {
  Future<File?> galleryImage() async {
    //To close the dialog and open gallery
    Get.close(1);
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }

  Future<File?> cameraImage() async {
    //To close the dialog and open gallery
    Get.close(1);
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }
}
