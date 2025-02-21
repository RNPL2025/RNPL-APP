import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/user/demo_user_data.dart';
import '../../../../../shared_controller/image_picker_controller.dart';
import '../../../../../widgets/acnoo_country_service.dart';

class EditProfileController extends GetxController {
  final userController = Get.put(AcnooCurrentUser());
  final imagePickerController = Get.put(AcnooImagePickerController());

  Rx<File?> profileImage = Rx<File?>(null);
  void getProfileImage(bool isCamera) async {
    profileImage.value = await (isCamera
        ? imagePickerController.cameraImage()
        : imagePickerController.galleryImage());
  }

  Rx<File?> idFrontImage = Rx<File?>(null);
  Rx<File?> idBackImage = Rx<File?>(null);
  void getFrontImage(bool isCamera) async {
    idFrontImage.value = await (isCamera
        ? imagePickerController.cameraImage()
        : imagePickerController.galleryImage());
  }

  void getBackImage(bool isCamera) async {
    idBackImage.value = await (isCamera
        ? imagePickerController.cameraImage()
        : imagePickerController.galleryImage());
  }

  List<String> genderOptions = ['Male', 'Female'];
  RxInt gender = 0.obs;
  void selectGender(int index) {}

  RxString countryPhoneCode = '00'.obs;

  void writeUserInfo() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        countryController.text.isNotEmpty &&
        mobileNumController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        stateController.text.isNotEmpty &&
        postalCodeController.text.isNotEmpty &&
        idNumberCodeController.text.isNotEmpty) {
      userController.currentUser.value = AcnooDemoUserModel(
        fullName: nameController.text,
        email: emailController.text,
        country: countryController.text,
        phoneNumber: mobileNumController.text,
        address: addressController.text,
        city: cityController.text,
        state: stateController.text,
        postalCode: postalCodeController.text,
        idCardNumber: idNumberCodeController.text,
      );
    } else {
      userController.currentUser.value = AcnooDemoUserModel();
    }
    print(userController.currentUser.value.fullName);
  }

//---------Text Editing Controller---------//
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController mobileNumController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController idNumberCodeController = TextEditingController();

  void setPhoneCode(String selected) {
    int i = AcnooCountryService.countries
        .indexWhere((element) => element.name == selected);

    countryPhoneCode.value = AcnooCountryService.countries[i].phoneCode;
  }

  @override
  void onInit() {
    super.onInit();
    AcnooCountryService.getCountries();
    print(userController.currentUser.value.fullName);
  }
}
