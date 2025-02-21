import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rentpro/app/widgets/constants.dart';

import '../controllers/property_map_controller.dart';

class PropertyMapView extends GetView<PropertyMapController> {
  const PropertyMapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        titleTextStyle: AcnooTextStyle.kBodySm
            .copyWith(color: AcnooAppColors.kNeutralColor900),
        titleSpacing: 0,
        title: Text(controller.args['title']),
        actions: [
          //Call Button
          Padding(
            padding: REdgeInsets.only(right: 24),
            child: Row(
              children: [
                Container(
                  height: 26.h,
                  width: 26.h,
                  decoration: BoxDecoration(
                      color: Color(0xffF0EDFE),
                      borderRadius: BorderRadius.circular(4)),
                  child: Icon(
                    IconlyBold.call,
                    color: AcnooAppColors.kPrimaryColor700,
                  ),
                ),
                RSizedBox(width: 16),
                //Whatsapp button
                Container(
                  height: 26.h,
                  width: 26.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/acnoo_assets/custom_icons/whatsapp_logo02.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/demo_images/demo_map_lg.png'),
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: REdgeInsets.all(24),
              height: 48.h,
              child: TextFormField(
                decoration: AcnooInputDecoration.kSearchInput.copyWith(
                  filled: true,
                  fillColor: AcnooAppColors.kWhite,
                  suffixIconColor: AcnooAppColors.kWhite,
                  hintText: 'Check for a office, school or hospital...',
                  suffixIcon: Container(
                    margin: REdgeInsets.all(4),
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      color: AcnooAppColors.kPrimaryColor700,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(IconlyLight.search),
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.125,
              minChildSize: 0.125,
              maxChildSize: 0.375,
              snap: true,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  color: AcnooAppColors.kWhite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 4.h,
                        width: 32.w,
                        margin: REdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: AcnooAppColors.kNeutralColor300,
                            borderRadius: BorderRadius.circular(24)),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            controller.suggestedLocations.length,
                            (index) => Padding(
                              padding: REdgeInsets.fromLTRB(
                                  index == 0 ? 24 : 0,
                                  8,
                                  index - 1 ==
                                          controller.suggestedLocations.length
                                      ? 0
                                      : 10,
                                  16),
                              child: InkWell(
                                onTap: () => controller.selectedLocation.value =
                                    controller.suggestedLocations.keys
                                        .toList()[index],
                                child: Obx(
                                  () => Container(
                                    decoration: BoxDecoration(
                                        color: controller.selectedLocation ==
                                                controller
                                                    .suggestedLocations.keys
                                                    .toList()[index]
                                            ? AcnooAppColors.kScaffoldBackground
                                            : AcnooAppColors.kWhite,
                                        borderRadius: BorderRadius.circular(8),
                                        border: controller.selectedLocation ==
                                                controller
                                                    .suggestedLocations.keys
                                                    .toList()[index]
                                            ? Border.all(
                                                color: AcnooAppColors
                                                    .kPrimaryColor700,
                                                width: 1.5)
                                            : Border.all(
                                                color: AcnooAppColors
                                                    .kNeutralColor200,
                                                width: 1.5)),
                                    padding: REdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 16.h,
                                          decoration: BoxDecoration(
                                            //TODO: Fix Image color on select
                                            image: DecorationImage(
                                              image: AssetImage(
                                                controller
                                                    .suggestedLocations.values
                                                    .toList()[index],
                                              ),
                                            ),
                                          ),
                                        ),
                                        RSizedBox(width: 8),
                                        Text(
                                          controller.suggestedLocations.keys
                                              .toList()[index],
                                          style: AcnooTextStyle.kBodyMd.copyWith(
                                              color: controller
                                                          .selectedLocation ==
                                                      controller
                                                          .suggestedLocations
                                                          .keys
                                                          .toList()[index]
                                                  ? AcnooAppColors
                                                      .kPrimaryColor700
                                                  : AcnooAppColors
                                                      .kNeutralColor600),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: REdgeInsets.fromLTRB(24, 12, 24, 12),
                        padding: REdgeInsets.fromLTRB(10, 12, 10, 10),
                        decoration: BoxDecoration(
                          color: AcnooAppColors.kWhite,
                          boxShadow: [
                            BoxShadow(
                                color: AcnooAppColors.kNeutralColor300,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 1.5,
                                spreadRadius: 0.5)
                          ],
                        ),
                        child: Column(
                          children: List.generate(
                            controller.hospitals.length,
                            (index) => Padding(
                              padding: REdgeInsets.only(
                                  bottom:
                                      index - 1 == controller.hospitals.length
                                          ? 0
                                          : 8),
                              child: Container(
                                height: 28.h,
                                child: Row(
                                  children: [
                                    Icon(
                                      MdiIcons.pill,
                                      size: 12.sp,
                                      color: index == 0
                                          ? AcnooAppColors.kPrimaryColor700
                                          : AcnooAppColors.kNeutralColor600,
                                    ),
                                    RSizedBox(width: 8),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.hospitals.keys
                                                .toList()[index],
                                            style: AcnooTextStyle.kCaption
                                                .copyWith(
                                                    fontSize: 13.sp,
                                                    color: index == 0
                                                        ? AcnooAppColors
                                                            .kPrimaryColor700
                                                        : AcnooAppColors
                                                            .kNeutralColor600),
                                          ),
                                          Text(
                                            "${controller.hospitals.values.toList()[index]} Km",
                                            style: AcnooTextStyle.kCaption
                                                .copyWith(
                                                    fontSize: 13.sp,
                                                    color: index == 0
                                                        ? AcnooAppColors
                                                            .kPrimaryColor700
                                                        : AcnooAppColors
                                                            .kNeutralColor600),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
