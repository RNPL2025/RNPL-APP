import 'package:get/get.dart';

class ChooseYourCityController extends GetxController {
  Map<String, String> demoCities = {
    'Dhaka': 'assets/images/cities/Dhaka.png',
    'Chittagong': 'assets/images/cities/Chittagong.png',
    'Mymensingh': 'assets/images/cities/Mymensingh.png',
    'Sonargaon': 'assets/images/cities/Sonargaon.png',
    'Tangail': 'assets/images/cities/Tangail.png',
    'Sylhet': 'assets/images/cities/Sylhet.png',
    'Narayanganj': 'assets/images/cities/Narayanganj.png',
    "Cox's Bazar": "assets/images/cities/Cox's Bazar.png",
    "Rajshahi": "assets/images/cities/Rajshahi.png",
  };
  late Rx<MapEntry<String, String>> selectedCity;

  List<String> cityList = [
    "Bhairab",
    "Bogura",
    "Brahmanbaria",
    "Chandpur",
    "Chowmuhani",
    "Chandpur",
    "Dinajpur",
    "Faridpur",
    "Feni",
    "Jamalpur",
    "Jashore	",
    "Jhenaidah",
    "Bandar",
    "Kaliakair",
  ];

  @override
  void onInit() {
    super.onInit();
    selectedCity = demoCities.entries.first.obs;
  }
}
