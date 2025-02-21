import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:unicons/unicons.dart';

import '../../../widgets/common_widgets.dart';
import '../../../widgets/constants.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: false),
      body: AcnooScaffoldContainer(
        topBar: Padding(
          padding: REdgeInsets.fromLTRB(26, 20, 24, 24),
          child: Row(
            children: [
              //Profile Image
              RSizedBox(
                height: 80,
                width: 80,
                child: Stack(
                  children: [
                    Obx(
                      () => Container(
                        height: 80.h,
                        width: 80.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AcnooAppColors.kPrimaryColor700,
                              width: 1.2),
                          image: controller.profileImage.value != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      FileImage(controller.profileImage.value!))
                              : DecorationImage(
                                  image: AssetImage(
                                      'assets/images/demo_images/demo_avatar01.png'),
                                ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () => showDialog(
                          context: context,
                          builder: (popupContext) => AcnooImagePickerPopup(
                            popupTitle: 'Select Option',
                            cameraImage: () => controller.getProfileImage(true),
                            galleryImage: () =>
                                controller.getProfileImage(false),
                          ),
                        ),
                        child: Container(
                          height: 30.h,
                          width: 30.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AcnooAppColors.kPrimaryColor700,
                            border: Border.all(
                                color: AcnooAppColors.kWhite, width: 4),
                          ),
                          child: Icon(
                            UniconsLine.camera,
                            size: 16.sp,
                            color: AcnooAppColors.kWhite,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              RSizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shaidul Islam',
                    style: AcnooTextStyle.kHeading2
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  RSizedBox(height: 6),
                  Text(
                    'example@gmail.com',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(color: AcnooAppColors.kNeutralColor600),
                  )
                ],
              )
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AcnooAppColors.kScaffoldBackground,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: ListView(
            padding: REdgeInsets.all(24),
            children: [
              buildNavigationTile(
                leadingIcon: IconlyBold.profile,
                title: 'Edit Profile',
                onTap: () => Get.toNamed('/edit-profile'),
              ),
              RSizedBox(height: 16),
              buildNavigationTile(
                leadingIcon: Icons.translate,
                title: 'Language',
                onTap: () => Get.toNamed('/language-select',
                    arguments: {'settings': true}),
              ),
              RSizedBox(height: 16),
              buildNavigationTile(
                leadingIcon: IconlyBold.notification,
                title: 'Notification',
                onTap: () => Get.toNamed('/notification'),
              ),
              RSizedBox(height: 16),
              buildNavigationTile(
                leadingIcon: IconlyBold.lock,
                title: 'Terms & Conditions',
                onTap: () => Get.toNamed('/terms-conditions'),
              ),
              RSizedBox(height: 16),
              buildNavigationTile(
                leadingIcon: IconlyBold.lock,
                title: 'About Us',
                onTap: () => Get.toNamed('/about-us'),
              ),
              RSizedBox(height: 16),
              buildNavigationTile(
                leadingIcon: IconlyBold.logout,
                title: 'Logout',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavigationTile(
      {required IconData leadingIcon,
      required String title,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.fromLTRB(10, 8, 16, 8),
        decoration: BoxDecoration(
          color: AcnooAppColors.kWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 34.h,
                  width: 34.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AcnooAppColors.kPrimaryColor700.withOpacity(0.15),
                  ),
                  child: Icon(
                    leadingIcon,
                    size: 20.sp,
                    color: AcnooAppColors.kPrimaryColor700,
                  ),
                ),
                RSizedBox(width: 16),
                Text(title, style: AcnooTextStyle.kBodyMd)
              ],
            ),
            Icon(UniconsLine.angle_right,
                size: 20.sp, color: AcnooAppColors.kNeutralColor600)
          ],
        ),
      ),
    );
  }
}
