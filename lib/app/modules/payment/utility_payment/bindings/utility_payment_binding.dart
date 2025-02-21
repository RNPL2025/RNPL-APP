import 'package:get/get.dart';

import '../controllers/utility_payment_controller.dart';

class UtilityPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtilityPaymentController>(
      () => UtilityPaymentController(),
    );
  }
}
