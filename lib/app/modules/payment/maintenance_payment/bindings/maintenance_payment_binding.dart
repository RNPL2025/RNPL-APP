import 'package:get/get.dart';

import '../controllers/maintenance_payment_controller.dart';

class MaintenancePaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaintenancePaymentController>(
      () => MaintenancePaymentController(),
    );
  }
}
