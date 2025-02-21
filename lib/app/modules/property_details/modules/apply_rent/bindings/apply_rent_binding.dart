import 'package:get/get.dart';

import '../controllers/apply_rent_controller.dart';

class ApplyRentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApplyRentController>(ApplyRentController());
  }
}
