import 'package:get/get.dart';

import '../controllers/acnoo_search_controller.dart';

class AcnooSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcnooSearchController>(
      () => AcnooSearchController(),
    );
  }
}
