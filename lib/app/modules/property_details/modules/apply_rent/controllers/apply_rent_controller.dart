import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentpro/app/data/property/property.dart';

class ApplyRentController extends GetxController {
  final Map<String, dynamic> args = Get.arguments;
  late AcnooPropertyModel property;

  ExpansionTileController tileController = ExpansionTileController();

  //Emergency Contact Relation's List
  List<String> relationWithYou = [
    "Parents ",
    "Friend ",
    "wife",
    "Brother",
    "Sister",
    "Other",
  ];

  List<String> vehiclesType = [
    "Bus",
    "Truck",
    "Ambulance",
    "Motorcycle",
    "Tractor",
    "Taxi",
    "Others",
  ];

  @override
  void onInit() {
    super.onInit();
    property = args['property'] as AcnooPropertyModel;
  }
}
