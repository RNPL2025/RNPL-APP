import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/property/property.dart';

class ApplicationsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  RxList<AcnooPropertyModel> demoPropertyList =
      AcnooDemoProperties.properties.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }
}
