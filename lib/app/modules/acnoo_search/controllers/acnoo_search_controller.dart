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
    "Chicago",
    "Houston", 
    "Los Angeles",
    "New York City",
    "Philadelphia",
    "Phoenix",
    "San Antonio",
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
