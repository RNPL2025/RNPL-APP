import 'package:get/get.dart';

import '../../../../../data/property/property.dart';

class ApplicationDetailsController extends GetxController {
  final Map<String, dynamic> args = Get.arguments;
  late AcnooPropertyModel property;

  @override
  void onInit() {
    super.onInit();
    property = args['property'] as AcnooPropertyModel;
  }
}
