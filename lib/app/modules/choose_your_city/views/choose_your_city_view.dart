import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../widgets/common_widgets.dart';
import '../../../widgets/constants.dart';
import '../controllers/choose_your_city_controller.dart';

class ChooseYourCityView extends GetView<ChooseYourCityController> {
  const ChooseYourCityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your City'),
        actions: [
          IconButton(
              onPressed: () => Get.offAllNamed('/home'),
              icon: Icon(Icons.close))
        ],
      ),
      bottomNavigationBar: Container(
        padding: REdgeInsets.fromLTRB(24, 16, 24, 12),
        decoration: BoxDecoration(
            color: AcnooAppColors.kWhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: TextButton(
            onPressed: () => Get.offAllNamed('/home'),
            style: AcnooButtonStyle.kPrimaryTextButton,
            child: Text('Continue')),
      ),
      body: AcnooScaffoldContainer(
        topBar: Padding(
          padding: REdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Center(
            child: Column(
              children: [
                Text('Are you looking to buy & rent',
                    style: AcnooTextStyle.kHeading2),
                RSizedBox(height: 8),
                Text('Choose a city here which can be changed later on',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(color: AcnooAppColors.kNeutralColor600)),
              ],
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffF2F3F8),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: ListView(
            padding: REdgeInsets.all(24),
            children: [
              //---------Search Field---------//
              Container(
                // padding: REdgeInsets,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: AcnooAppColors.kNeutralColor200,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 0.5,
                      offset: Offset(0, 2.5))
                ]),
                child: TextFormField(
                  decoration: AcnooInputDecoration.kSearchInput.copyWith(
                      hintText: 'Search city here....',
                      filled: true,
                      fillColor: AcnooAppColors.kWhite,
                      suffixIcon: Padding(
                        padding: REdgeInsets.all(4.0),
                        child: Container(
                          height: 40.h,
                          width: 40.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AcnooAppColors.kPrimaryColor700,
                              borderRadius: BorderRadius.circular(6)),
                          child: Icon(IconlyLight.search,
                              color: AcnooAppColors.kWhite, size: 20.sp),
                        ),
                      )),
                ),
              ),
              RSizedBox(height: 16),
              Row(
                children: [
                  Icon(FeatherIcons.crosshair,
                      size: 20.sp, color: AcnooAppColors.kPrimaryColor700),
                  RSizedBox(width: 8),
                  Text(
                    'My current location',
                    style: AcnooTextStyle.kBodySm
                        .copyWith(color: AcnooAppColors.kNeutralColor600),
                  ),
                  RSizedBox(width: 20),
                  Icon(BootstrapIcons.chevron_right,
                      size: 16.sp, color: AcnooAppColors.kPrimaryColor700),
                ],
              ),
              RSizedBox(height: 8 * 3),
              Text(
                'Popular Cities',
                style: AcnooTextStyle.kBodySm
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              RSizedBox(height: 8 * 2),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 102.w / 80.h,
                    crossAxisCount: 3,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 10.w),
                itemCount: controller.demoCities.length,
                itemBuilder: (context, index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => controller.selectedCity.value =
                          controller.demoCities.entries.toList()[index],
                      child: Obx(
                        () => Container(
                          height: 60.h,
                          width: 102.w,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: controller.selectedCity.value.key ==
                                    controller.demoCities.keys.toList()[index]
                                ? Border.all(
                                    width: 1.2.w,
                                    color: AcnooAppColors.kPrimaryColor700,
                                  )
                                : null,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  controller.demoCities.values.toList()[index]),
                            ),
                          ),
                          child: controller.selectedCity.value.key ==
                                  controller.demoCities.keys.toList()[index]
                              ? Icon(Icons.check_circle,
                                  color: AcnooAppColors.kPrimaryColor700)
                              : null,
                        ),
                      ),
                    ),
                    RSizedBox(height: 4),
                    Text(
                      controller.demoCities.keys.toList()[index],
                      style: AcnooTextStyle.kCaption
                          .copyWith(color: AcnooAppColors.kNeutralColor600),
                    )
                  ],
                ),
              ),
              RSizedBox(height: 8 * 3),
              Text(
                'All Cities',
                style: AcnooTextStyle.kBodySm
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              RSizedBox(height: 8 * 2),
              Container(
                padding: REdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AcnooAppColors.kWhite,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        (controller.cityList.length + 1) ~/ 2,
                        (index) {
                          final cityIndex = index * 2;
                          if (cityIndex < controller.cityList.length) {
                            return Padding(
                              padding: REdgeInsets.only(bottom: 12),
                              child: InkWell(
                                  onTap: () =>
                                      print(controller.cityList[cityIndex]),
                                  child: Text(
                                    controller.cityList[cityIndex],
                                    style: AcnooTextStyle.kCaption.copyWith(
                                        color: AcnooAppColors.kNeutralColor600),
                                  )),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        controller.cityList.length ~/ 2,
                        (index) {
                          final cityIndex = index * 2 + 1;
                          return Padding(
                            padding: REdgeInsets.only(bottom: 12),
                            child: InkWell(
                                onTap: () =>
                                    print(controller.cityList[cityIndex]),
                                child: Text(
                                  controller.cityList[cityIndex],
                                  style: AcnooTextStyle.kCaption.copyWith(
                                      color: AcnooAppColors.kNeutralColor600),
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
