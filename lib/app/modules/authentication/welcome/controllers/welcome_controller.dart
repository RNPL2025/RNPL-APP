import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeController extends GetxController {
  final GetStorage box = GetStorage();

  RxInt selectedButton = 0.obs;
  void nextButton() {
    if (selectedButton == 0) {
      Get.toNamed(
        '/login',
        arguments: {'user': 'Tenant & Customer'},
      );
    } else {
      Get.toNamed(
        '/login',
        arguments: {'user': 'Agent, Owner & Landlord'},
      );
    }
  }

  void handleGuestButton() async {
    await box.write('user', 'Guest').then((value) => Get.offAllNamed('/home'));
  }
}
