import 'package:get/get.dart';
import 'package:rentpro/app/data/user/demo_user_data.dart';

import '../controllers/setup_profile_controller.dart';

class SetupProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SetupProfileController>(SetupProfileController());
    Get.put<AcnooCurrentUser>(AcnooCurrentUser());
  }
}
