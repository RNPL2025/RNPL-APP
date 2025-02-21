import 'package:get/get.dart';
import 'package:rentpro/app/widgets/constants.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      Duration(milliseconds: 1800),
      () => Get.offAllNamed('/language-select', arguments: {'settings': false}),
      // () => Get.offAllNamed('/home'),
    );
    AcnooCommonUtils.getColors();
  }
}
