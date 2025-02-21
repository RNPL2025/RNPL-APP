import 'package:get/get.dart';

class LanguageSelectController extends GetxController {
  bool isSettings = Get.arguments['settings'];
  final List<AcnooLanguageModel> supportedLanguage = [
    AcnooLanguageModel(countryCode: 'US', languageName: 'English'),
    AcnooLanguageModel(countryCode: 'ES', languageName: 'Spanish'),
    AcnooLanguageModel(countryCode: 'IN', languageName: 'Hindi'),
    AcnooLanguageModel(countryCode: 'SA', languageName: 'Arabic'),
    AcnooLanguageModel(countryCode: 'FR', languageName: 'France'),
    AcnooLanguageModel(countryCode: 'BD', languageName: 'Bengali'),
    AcnooLanguageModel(countryCode: 'TR', languageName: 'Turkish'),
    AcnooLanguageModel(countryCode: 'RO', languageName: 'Romanian'),
    AcnooLanguageModel(countryCode: 'BA', languageName: 'Bosnian'),
    AcnooLanguageModel(countryCode: 'NL', languageName: 'Dutch'),
  ];

  late Rx<AcnooLanguageModel> selectedLanguage;

  @override
  void onInit() {
    super.onInit();
    selectedLanguage = supportedLanguage.first.obs;
  }

  void handleNextButton() {
    if (isSettings) {
      //TODO:Save selected language when working with api
      Get.back();
    } else {
      Get.offAllNamed('/onboarding');
    }
  }
}

class AcnooLanguageModel {
  final String countryCode;
  final String languageName;

  AcnooLanguageModel({
    required this.countryCode,
    required this.languageName,
  });
}
