import 'package:get/get.dart';

import '../controllers/language_select_controller.dart';

class LanguageSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageSelectController>(
      () => LanguageSelectController(),
    );
  }
}
