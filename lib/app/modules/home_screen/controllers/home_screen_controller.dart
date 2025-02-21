import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentpro/app/data/property/property.dart';

import '../../favorites/controllers/favorites_controller.dart';

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final favController = Get.put(FavoritesController());
  RxString selectedCity = RxString('New York City');
  RxInt selectedTab = 0.obs;
  List<String> cityList = [
    "Austin",
    "Chicago",
    "Columbus",
    "Dallas",
    "Fort Worth",
    "Houston",
    "Indianapolis",
    "Jacksonville",
    "Los Angeles",
    "New York City",
    "Philadelphia",
    "Phoenix",
    "San Antonio",
    "San Diego",
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
