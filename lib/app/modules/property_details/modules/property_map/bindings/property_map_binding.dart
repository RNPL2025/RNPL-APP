import 'package:get/get.dart';

import '../controllers/property_map_controller.dart';

class PropertyMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyMapController>(
      () => PropertyMapController(),
    );
  }
}
