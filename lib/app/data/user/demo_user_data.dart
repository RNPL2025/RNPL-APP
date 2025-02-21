import 'package:get/get.dart';

class AcnooCurrentUser extends GetxController {
  Rx<AcnooDemoUserModel> currentUser = AcnooDemoUserModel().obs;
}

class AcnooDemoUserModel {
  final String? fullName;
  final String? email;
  final String? country;
  final String? coutryCode;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? gender;
  final String? idCardNumber;

  AcnooDemoUserModel({
    this.fullName,
    this.email,
    this.country,
    this.coutryCode,
    this.phoneNumber,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.gender,
    this.idCardNumber,
  });
}
