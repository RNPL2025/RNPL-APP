import 'package:get/get.dart';

import '../controllers/application_details_controller.dart';

class ApplicationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationDetailsController>(
      () => ApplicationDetailsController(),
    );
  }
}
