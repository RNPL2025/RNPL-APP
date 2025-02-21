import 'package:get/get.dart';

import '../controllers/choose_your_city_controller.dart';

class ChooseYourCityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseYourCityController>(
      () => ChooseYourCityController(),
    );
  }
}
