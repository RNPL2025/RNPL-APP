import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../favorites/controllers/favorites_controller.dart';

class AcnooSearchResultController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final favController = Get.put(FavoritesController());
  final Map<String, dynamic> args = Get.arguments;

  TextEditingController searchController = TextEditingController();
  RxInt isBuy = 0.obs;
  Rx<SfRangeValues> propertySize = SfRangeValues(450, 5000).obs;
  Rx<SfRangeValues> budget = SfRangeValues(5000, 10000000).obs;

  Rx<String> selectedPropertyType = "Apartment".obs;
  List<String> propertyType = [
    "Apartment",
    "House",
    "Land",
    "Room",
    "Builder Floor",
    "Commercial Property",
    "Studio",
    "Duplex",
    "Villa",
  ];

  RxInt listedby = 0.obs;

  Rx<String> selectedFloorRange = "High".obs;
  List<String> floorRange = [
    "High",
    "Medium",
    "Low",
  ];

  RxInt selectedBedrooms = 1.obs;
  RxInt selectedBathrooms = 1.obs;

  Map<String, RxBool> facilities = {
    "Parking": false.obs,
    "Security": false.obs,
    "Lift": false.obs,
    "Swimming Pool": false.obs,
    "Playground": false.obs,
    "Gymnasium": false.obs,
    "Sauna": false.obs,
    "Barbeque area": false.obs,
    "Minimart": false.obs,
    "Multipurpose hall": false.obs,
  };

  Map<String, RxBool> amenities = {
    "Air - Cond": false.obs,
    "Cooking Allowed": false.obs,
    "Near KTM/LRT": false.obs,
    "Washing Machine": false.obs,
    "Internet": false.obs,
  };

//For text formatting like (10k,100k,1M,10M etc.)
  String formatLabelText(value) {
    if (value >= 1000000) {
      return '\$${(value ~/ 1000000).toString()}M';
    } else if (value >= 100000) {
      return '\$${(value ~/ 1000).toString()}k';
    } else if (value >= 10000) {
      return '\$${(value ~/ 10000).toString()}0k';
    } else {
      return '\$$value';
    }
  }

  late TabController tabController;
  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    searchController.text = await args['searchFieldValue'];
  }
}
