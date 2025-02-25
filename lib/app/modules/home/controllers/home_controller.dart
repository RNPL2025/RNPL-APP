import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:rentpro/app/modules/chats/views/chats_view.dart';
import 'package:rentpro/app/modules/dashboard/views/dashboard_view.dart';
import 'package:rentpro/app/modules/favorites/views/favorites_view.dart';
import 'package:rentpro/app/modules/home_screen/views/home_screen_view.dart';
import 'package:rentpro/app/modules/user_profile/views/user_profile_view.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt currentIndex = 0.obs;
  final RxList<Widget> navBody = <Widget>[
    HomeScreenView(),
    FavoritesView(),
    ChatsView(),
    UserProfileView(),
  ].obs;

  final Map<String, Map<String, dynamic>> drawerItems = {
    "Home": {
      'Icon': IconlyBold.home,
      'isActive': true.obs,
    },
    "Favorites": {
      'Icon': Icons.favorite,
      'isActive': false.obs,
    },
    "Dashboard": {
      'Icon': IconlyBold.category,
      'isActive': false.obs,
    },
    "Subscription": {
      'Icon': IconlyBold.ticket_star,
      'isActive': false.obs,
    },
    "Applications": {
      'Icon': IconlyBold.send,
      'isActive': false.obs,
    },
    "News & Blog": {
      'Icon': IconlyBold.document,
      'isActive': false.obs,
    },
    "Payment": {
      'Icon': IconlyBold.wallet,
      'isActive': false.obs,
    },
    "Log Out": {
      'Icon': IconlyBold.logout,
      'isActive': false.obs,
    },
  };

  void handleDrawerNavigation({required int index, required String navigate}) {
    if (index + 1 <= 3) {
      currentIndex.value = index;
    } else {
      switch (navigate) {
        case 'Subscription':
          {
            Get.toNamed('/subscription');
          }
        case 'Applications':
          {
            Get.toNamed('/applications');
          }
        case 'News & Blog':
          {
            Get.toNamed('/news-article-list');
          }
        default:
          {}
      }
    }
    scaffoldKey.currentState?.openEndDrawer();
  }

  void toggleBool({required List<bool> groupValue, required int index}) {
    for (int i = 0; i < groupValue.length; i++) {
      if (i == index) {
        groupValue[i] = true;
      } else {
        groupValue[i] = false;
      }
    }
  }

  void changeIndex(int value) {
    currentIndex.value = value;
    update();
  }
}
