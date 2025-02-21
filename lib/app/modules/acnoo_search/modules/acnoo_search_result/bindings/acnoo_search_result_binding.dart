import 'package:get/get.dart';

import '../controllers/acnoo_search_result_controller.dart';

class AcnooSearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AcnooSearchResultController>(AcnooSearchResultController());
  }
}
