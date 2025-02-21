import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentpro/app/data/property/property.dart';

class FavoritesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList<AcnooPropertyModel> favList = <AcnooPropertyModel>[].obs;
  late TabController tabController;

  void addToFavList(AcnooPropertyModel property) {
    if (favList.contains(property)) {
      favList.remove(property);
      print('Already Added');
    } else {
      favList.add(property);
      print("addded");
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }
}
