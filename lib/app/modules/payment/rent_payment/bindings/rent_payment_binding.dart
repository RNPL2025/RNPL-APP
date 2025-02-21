import 'package:get/get.dart';

import '../controllers/rent_payment_controller.dart';

class RentPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentPaymentController>(
      () => RentPaymentController(),
    );
  }
}
