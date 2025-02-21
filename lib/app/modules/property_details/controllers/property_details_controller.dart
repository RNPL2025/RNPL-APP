import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconly/iconly.dart';

import '../../../data/property/property.dart';
import '../../favorites/controllers/favorites_controller.dart';

class PropertyDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GetStorage box = GetStorage();
  final Map<String, dynamic> args = Get.arguments;
  String? user;
  final FocusNode formFocusNode = FocusNode();

  RxBool formFocus = false.obs;
  RxBool obscureText = true.obs;
  RxBool rememberMe = false.obs;

  late AcnooPropertyModel property;
  final favController = Get.put(FavoritesController());

  ScrollController scrollController = ScrollController();

  final GlobalKey aboutSectionKey = GlobalKey();
  final GlobalKey propertyTypesKey = GlobalKey();
  final GlobalKey featuresKey = GlobalKey();
  final GlobalKey floorPlanKey = GlobalKey();

  RxString selectedTab = "About".obs;

  late Map<String, Map<GlobalKey, IconData>> tabItems;

  @override
  void onInit() {
    super.onInit();
    user = box.read('user');
    property = args['property'] as AcnooPropertyModel;

    tabItems = {
      "About": {aboutSectionKey: IconlyBold.shield_done},
      "Property Types": {propertyTypesKey: IconlyBold.document},
      "Features": {featuresKey: IconlyBold.ticket_star},
      "Floor Plans": {floorPlanKey: IconlyBold.graph}
    };
  }
}
