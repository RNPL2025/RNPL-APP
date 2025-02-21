import 'package:get/get.dart';

import '../modules/acnoo_search/bindings/acnoo_search_binding.dart';
import '../modules/acnoo_search/modules/acnoo_search_result/bindings/acnoo_search_result_binding.dart';
import '../modules/acnoo_search/modules/acnoo_search_result/views/acnoo_search_result_view.dart';
import '../modules/acnoo_search/views/acnoo_search_view.dart';
import '../modules/applications/bindings/applications_binding.dart';
import '../modules/applications/modules/application_details/bindings/application_details_binding.dart';
import '../modules/applications/modules/application_details/views/application_details_view.dart';
import '../modules/applications/views/applications_view.dart';
import '../modules/authentication/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/authentication/forgot_password/views/forgot_password_view.dart';
import '../modules/authentication/language_select/bindings/language_select_binding.dart';
import '../modules/authentication/language_select/views/language_select_view.dart';
import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/new_password/bindings/new_password_binding.dart';
import '../modules/authentication/new_password/views/new_password_view.dart';
import '../modules/authentication/onboarding/bindings/onboarding_binding.dart';
import '../modules/authentication/onboarding/views/onboarding_view.dart';
import '../modules/authentication/setup_profile/bindings/setup_profile_binding.dart';
import '../modules/authentication/setup_profile/views/setup_profile_view.dart';
import '../modules/authentication/signup/bindings/signup_binding.dart';
import '../modules/authentication/signup/views/signup_view.dart';
import '../modules/authentication/splash/bindings/splash_binding.dart';
import '../modules/authentication/splash/views/splash_view.dart';
import '../modules/authentication/verification/bindings/verification_binding.dart';
import '../modules/authentication/verification/views/verification_view.dart';
import '../modules/authentication/welcome/bindings/welcome_binding.dart';
import '../modules/authentication/welcome/views/welcome_view.dart';
import '../modules/chats/bindings/chats_binding.dart';
import '../modules/chats/modules/chat_details/bindings/chat_details_binding.dart';
import '../modules/chats/modules/chat_details/views/chat_details_view.dart';
import '../modules/chats/views/chats_view.dart';
import '../modules/choose_your_city/bindings/choose_your_city_binding.dart';
import '../modules/choose_your_city/views/choose_your_city_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/favorites/bindings/favorites_binding.dart';
import '../modules/favorites/views/favorites_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/payment/maintenance_payment/bindings/maintenance_payment_binding.dart';
import '../modules/payment/maintenance_payment/views/maintenance_payment_view.dart';
import '../modules/news_article_list/bindings/news_article_list_binding.dart';
import '../modules/news_article_list/modules/news_article_details/bindings/news_article_details_binding.dart';
import '../modules/news_article_list/modules/news_article_details/views/news_article_details_view.dart';
import '../modules/news_article_list/views/news_article_list_view.dart';
import '../modules/payment/offline_payment/bindings/offline_payment_binding.dart';
import '../modules/payment/offline_payment/views/offline_payment_view.dart';
import '../modules/payment/rent_payment/bindings/rent_payment_binding.dart';
import '../modules/payment/rent_payment/views/rent_payment_view.dart';
import '../modules/payment/utility_payment/bindings/utility_payment_binding.dart';
import '../modules/payment/utility_payment/views/utility_payment_view.dart';
import '../modules/property_details/bindings/property_details_binding.dart';
import '../modules/property_details/modules/apply_rent/bindings/apply_rent_binding.dart';
import '../modules/property_details/modules/apply_rent/views/apply_rent_view.dart';
import '../modules/property_details/modules/property_map/bindings/property_map_binding.dart';
import '../modules/property_details/modules/property_map/views/property_map_view.dart';
import '../modules/property_details/views/property_details_view.dart';
import '../modules/payment/refund_request/bindings/refund_request_binding.dart';
import '../modules/payment/refund_request/views/refund_request_view.dart';
import '../modules/subscription/bindings/subscription_binding.dart';
import '../modules/subscription/views/subscription_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/modules/about_us/bindings/about_us_binding.dart';
import '../modules/user_profile/modules/about_us/views/about_us_view.dart';
import '../modules/user_profile/modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/user_profile/modules/edit_profile/views/edit_profile_view.dart';
import '../modules/user_profile/modules/notification/bindings/notification_binding.dart';
import '../modules/user_profile/modules/notification/views/notification_view.dart';
import '../modules/user_profile/modules/terms_conditions/bindings/terms_conditions_binding.dart';
import '../modules/user_profile/modules/terms_conditions/views/terms_conditions_view.dart';
import '../modules/user_profile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
        HomeScreenBinding(),
        FavoritesBinding(),
        DashboardBinding(),
        ChatsBinding(),
        UserProfileBinding(),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE_SELECT,
      page: () => const LanguageSelectView(),
      binding: LanguageSelectBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SETUP_PROFILE,
      page: () => const SetupProfileView(),
      binding: SetupProfileBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => const VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_YOUR_CITY,
      page: () => const ChooseYourCityView(),
      binding: ChooseYourCityBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => const ChatsView(),
      binding: ChatsBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.ACNOO_SEARCH,
      page: () => const AcnooSearchView(),
      binding: AcnooSearchBinding(),
    ),
    GetPage(
      name: _Paths.ACNOO_SEARCH_RESULT,
      page: () => const AcnooSearchResultView(),
      binding: AcnooSearchResultBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_DETAILS,
      page: () => const PropertyDetailsView(),
      binding: PropertyDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_MAP,
      page: () => const PropertyMapView(),
      binding: PropertyMapBinding(),
    ),
    GetPage(
      name: _Paths.APPLY_RENT,
      page: () => const ApplyRentView(),
      binding: ApplyRentBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITIONS,
      page: () => const TermsConditionsView(),
      binding: TermsConditionsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_DETAILS,
      page: () => const ChatDetailsView(),
      binding: ChatDetailsBinding(),
    ),
    GetPage(
      name: _Paths.APPLICATIONS,
      page: () => const ApplicationsView(),
      binding: ApplicationsBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () => const SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.APPLICATION_DETAILS,
      page: () => const ApplicationDetailsView(),
      binding: ApplicationDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_ARTICLE_LIST,
      page: () => const NewsArticleListView(),
      binding: NewsArticleListBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_ARTICLE_DETAILS,
      page: () => const NewsArticleDetailsView(),
      binding: NewsArticleDetailsBinding(),
    ),
    GetPage(
      name: _Paths.RENT_PAYMENT,
      page: () => const RentPaymentView(),
      binding: RentPaymentBinding(),
    ),
    GetPage(
      name: _Paths.OFFLINE_PAYMENT,
      page: () => const OfflinePaymentView(),
      binding: OfflinePaymentBinding(),
    ),
    GetPage(
      name: _Paths.UTILITY_PAYMENT,
      page: () => const UtilityPaymentView(),
      binding: UtilityPaymentBinding(),
    ),
    GetPage(
      name: _Paths.MAINTENANCE_PAYMENT,
      page: () => const MaintenancePaymentView(),
      binding: MaintenancePaymentBinding(),
    ),
    GetPage(
      name: _Paths.REFUND_REQUEST,
      page: () => const RefundRequestView(),
      binding: RefundRequestBinding(),
    ),
  ];
}
