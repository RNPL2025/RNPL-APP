import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcnooSearchController extends GetxController {
  Map<String, dynamic> args = Get.arguments;
  List<String> popularSearches = [
    "Apartment",
    "House",
    "Villa",
    "Land",
    "Studio",
    "Room",
    "Duplex",
    "Commercial Property",
    "Residential ",
  ];
  List<String> demoSearch = [
    "Dhaka Dhanmondi",
    "Dhaka Bonani",
    "Dhaka Mirpur",
    "Dhaka Gazipur",
    "Gulshan 1",
    "Gulshan 2",
    "Kolkata Konnection",
  ];

  List<String> demoSuggestion(String query) {
    List<String> matches = <String>[];
    for (var element in demoSearch) {
      matches.add(element);
    }

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  RxBool showSuggestions = false.obs;
  TextEditingController searchFieldController = TextEditingController();
}
