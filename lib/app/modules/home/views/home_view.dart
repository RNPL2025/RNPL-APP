import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:unicons/unicons.dart';

import '../../../widgets/constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, IconData> navItems = {
      "Home": IconlyLight.home,
      "Favorites": IconlyLight.heart,
      "Dashboard": IconlyLight.category,
      "Chats": IconlyLight.chat,
      "Profile": IconlyLight.profile,
    };
    Map<String, IconData> selectedNavItems = {
      "Home": IconlyBold.home,
      "Favorites": IconlyBold.heart,
      "Dashboard": IconlyBold.category,
      "Chats": IconlyBold.chat,
      "Profile": IconlyBold.profile,
    };

    return GetX<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          key: _.scaffoldKey,
          backgroundColor: AcnooAppColors.kPrimaryColor700,
          appBar: controller.currentIndex == 0
              ? AppBar(
                  centerTitle: false,
                  title: Image.asset(
                    'assets/images/acnoo_assets/rnpl_logo_slim.png',
                    height: 38.h,
                  ),
                  // Comment out iconTheme to remove hamburger icon
                  // iconTheme: IconThemeData(color: AcnooAppColors.kWhite),
                  actions: [
                    Padding(
                      padding: REdgeInsets.fromLTRB(0, 10, 12, 10),
                      child: Container(
                        height: 44.h,
                        width: 44.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AcnooAppColors.kWhite),
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(
                                    'assets/images/demo_images/demo_avatar01.png'))),
                      ),
                    )
                  ],
                )
              : null,
          // Comment out drawer
          // drawer: SafeArea(child: HomeDrawer()),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AcnooAppColors.kWhite,
            currentIndex: controller.currentIndex.value,
            onTap: (value) => controller.changeIndex(value),
            items: List.generate(navItems.length, (index) {
              final itemName = navItems.keys.toList()[index];
              final itemIcon = controller.currentIndex.value == index
                  ? selectedNavItems[itemName]
                  : navItems[itemName];

              return BottomNavigationBarItem(
                icon: Container(
                  alignment: Alignment.center,
                  padding: REdgeInsets.all(2),
                  decoration: controller.currentIndex.value == index
                      ? BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(
                                'assets/images/acnoo_assets/navBg.png'),
                          ),
                        )
                      : null,
                  child: Icon(itemIcon),
                ),
                label: itemName,
              );
            }),
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.navBody,
          ),
        );
      },
    );
  }
}

class HomeDrawer extends GetView<HomeController> {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 64.h,
            color: AcnooAppColors.kPrimaryColor50,
            padding: REdgeInsets.fromLTRB(24, 15, 14, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 34.h,
                  width: 117.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/acnoo_assets/rentpro_logo_02.png'),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close),
                )
              ],
            ),
          ),
          RSizedBox(height: 16),
          ...List.generate(
            controller.drawerItems.length,
            (index) => Padding(
              padding: REdgeInsets.only(bottom: 4, right: 16),
              child: controller.drawerItems.keys.toList()[index] == 'Payment'
                  ? ExpansionWidget(
                      titleBuilder: (animationValue, easeInValue, isExpanded,
                              toggleFunction) =>
                          InkWell(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(30)),
                        onTap: () => toggleFunction(
                          animated: true,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: controller.drawerItems.values
                                    .toList()[index]['isActive']
                                    .value
                                ? AcnooAppColors.kScaffoldBackground
                                : null,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(30),
                            ),
                          ),
                          padding: REdgeInsets.fromLTRB(24, 8, 16, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    controller.drawerItems.values
                                        .toList()[index]['Icon'],
                                    color: controller.drawerItems.values
                                            .toList()[index]['isActive']
                                            .value
                                        ? AcnooAppColors.kPrimaryColor700
                                        : AcnooAppColors.kNeutralColor600,
                                  ),
                                  RSizedBox(width: 12),
                                  Text(
                                    controller.drawerItems.keys.toList()[index],
                                    style: AcnooTextStyle.kBodyMd.copyWith(
                                      color: controller.drawerItems.values
                                              .toList()[index]['isActive']
                                              .value
                                          ? AcnooAppColors.kPrimaryColor700
                                          : AcnooAppColors.kNeutralColor600,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                isExpanded
                                    ? UniconsLine.angle_down
                                    : UniconsLine.angle_right,
                                color: controller.drawerItems.values
                                        .toList()[index]['isActive']
                                        .value
                                    ? AcnooAppColors.kPrimaryColor700
                                    : AcnooAppColors.kNeutralColor600,
                              )
                            ],
                          ),
                        ),
                      ),
                      content: Padding(
                        padding: REdgeInsets.only(top: 12, left: 52, right: 16),
                        child: Column(
                          children: [
                            buildSubsectionRow(
                              title: 'Rent Payment',
                              onTap: () {
                                Get.toNamed('/rent-payment');
                                controller.scaffoldKey.currentState
                                    ?.openEndDrawer();
                              },
                            ),
                            buildSubsectionRow(
                              title: 'Utility Payment',
                              onTap: () {
                                Get.toNamed('/utility-payment');
                                controller.scaffoldKey.currentState
                                    ?.openEndDrawer();
                              },
                            ),
                            buildSubsectionRow(
                              title: 'Maintenance Payment',
                              onTap: () {
                                Get.toNamed('/maintenance-payment');
                                controller.scaffoldKey.currentState
                                    ?.openEndDrawer();
                              },
                            ),
                            buildSubsectionRow(
                              title: 'Refund Request',
                              onTap: () {
                                Get.toNamed('/refund-request');
                                controller.scaffoldKey.currentState
                                    ?.openEndDrawer();
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Obx(
                      () => InkWell(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(30)),
                        onTap: () => controller.handleDrawerNavigation(
                            index: index,
                            navigate:
                                controller.drawerItems.keys.toList()[index]),
                        child: Container(
                          decoration: BoxDecoration(
                            color: controller.drawerItems.values
                                    .toList()[index]['isActive']
                                    .value
                                ? AcnooAppColors.kScaffoldBackground
                                : null,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(30),
                            ),
                          ),
                          padding: REdgeInsets.fromLTRB(24, 8, 16, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    controller.drawerItems.values
                                        .toList()[index]['Icon'],
                                    color: controller.drawerItems.values
                                            .toList()[index]['isActive']
                                            .value
                                        ? AcnooAppColors.kPrimaryColor700
                                        : AcnooAppColors.kNeutralColor600,
                                  ),
                                  RSizedBox(width: 12),
                                  Text(
                                    controller.drawerItems.keys.toList()[index],
                                    style: AcnooTextStyle.kBodyMd.copyWith(
                                      color: controller.drawerItems.values
                                              .toList()[index]['isActive']
                                              .value
                                          ? AcnooAppColors.kPrimaryColor700
                                          : AcnooAppColors.kNeutralColor600,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                UniconsLine.angle_right,
                                color: controller.drawerItems.values
                                        .toList()[index]['isActive']
                                        .value
                                    ? AcnooAppColors.kPrimaryColor700
                                    : AcnooAppColors.kNeutralColor600,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSubsectionRow({required String title, VoidCallback? onTap}) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AcnooTextStyle.kBodySm
                    .copyWith(color: AcnooAppColors.kNeutralColor600),
              ),
              Icon(
                UniconsLine.angle_right,
                size: 20.sp,
                color: AcnooAppColors.kNeutralColor600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
