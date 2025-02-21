import 'package:get/get.dart';

import '../controllers/offline_payment_controller.dart';

class OfflinePaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfflinePaymentController>(
      () => OfflinePaymentController(),
    );
  }
}
