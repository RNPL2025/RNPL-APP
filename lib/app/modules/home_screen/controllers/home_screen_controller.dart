import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentpro/app/data/property/property.dart';

import '../../favorites/controllers/favorites_controller.dart';

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final favController = Get.put(FavoritesController());
  RxString selectedCity = RxString('Dhaka');
  RxInt selectedTab = 0.obs;
  List<String> cityList = [
    "Dhaka",
    "Bhairab",
    "Bogura",
    "Brahmanbaria",
    "Chowmuhani",
    "Chandpur",
    "Dinajpur",
    "Faridpur",
    "Feni",
    "Jamalpur",
    "Jashore	",
    "Jhenaidah",
    "Bandar",
    "Kaliakair",
  ];

  void addToFavList(AcnooPropertyModel property) {
    if (favController.favList.contains(property)) {
      favController.favList.remove(property);
      print('Already Added');
    } else {
      favController.favList.add(property);
      print("addded");
    }
    update();
    favController.update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => selectedTab.value = tabController.index);
  }
}
