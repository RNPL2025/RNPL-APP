import 'package:get/get.dart';

class PropertyMapController extends GetxController {
  final Map<String, dynamic> args = Get.arguments;

  Map<String, String> suggestedLocations = {
    "Hospital": 'assets/images/acnoo_assets/custom_icons/hospital.png',
    "Banks": 'assets/images/acnoo_assets/custom_icons/bank.png',
    "Shopping": 'assets/images/acnoo_assets/custom_icons/shopping.png',
    "Parks": 'assets/images/acnoo_assets/custom_icons/park.png',
    "Restaurants": 'assets/images/acnoo_assets/custom_icons/restaurant.png'
  };
  RxString selectedLocation = 'Hospital'.obs;

  //Demo locations
  Map<String, double> hospitals = {
    "Dhanmondi Hospital (PVT) Ltd": 1.5,
    "IBN Sina Specialized Hospital": 2.2,
    "Central Hospital Limited": 2.8,
    "Square Hospital Limited": 3.7
  };
}
