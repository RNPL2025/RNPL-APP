class AcnooOnboardItems {
  static List<_OnboardItem> onboardItems = [
    _OnboardItem(
      imageUrl: 'assets/images/onboarding_images/onboard_image01.png',
      title: 'Find Your Property',
      description:
          'Purus sapien urna enim ipsum pret ium dictum. Volutpat tristique lect us vive pellentesque lect us vive pellentesque',
    ),
    _OnboardItem(
      imageUrl: 'assets/images/onboarding_images/onboard_image02.png',
      title: 'Apartment In Town',
      description:
          'Purus sapien urna enim ipsum pret ium dictum. Volutpat tristique lect us vive pellentesque lect us vive pellentesque ',
    ),
    _OnboardItem(
      imageUrl: 'assets/images/onboarding_images/onboard_image03.png',
      title: 'Your Comfort House',
      description:
          'Purus sapien urna enim ipsum pret ium dictum. Volutpat tristique lect us vive pellentesque lect us vive pellentesque',
    ),
  ];
}

class _OnboardItem {
  final String imageUrl;
  final String title;
  final String description;

  _OnboardItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}
