import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:rentpro/app/modules/property_details/widgets/phone_number_modal_sheet.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:unicons/unicons.dart';

import '../../../data/property/property.dart';
import '../../../widgets/acnoo_country_service.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/constants.dart';
import '../controllers/property_details_controller.dart';

class PropertyDetailsView extends GetView<PropertyDetailsController> {
  const PropertyDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext buildContext) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AcnooAppColors.kWhite,
        bottomNavigationBar: Container(
          padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
          color: AcnooAppColors.kWhite,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Whatsapp button
              InkWell(
                onTap: () {
                  if (controller.user == 'Guest') {
                    Get.bottomSheet(
                      buildGuestLogin(context: buildContext),
                      backgroundColor: AcnooAppColors.kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                    );
                  } else {
                    Get.toNamed(
                      '/apply-rent',
                      arguments: {'property': controller.property},
                    );
                  }
                },
                child: Container(
                  height: 48.h,
                  width: 48.h,
                  padding: REdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0xffF0EDFE),
                      borderRadius: BorderRadius.circular(4)),
                  child: Image.asset(
                      'assets/images/acnoo_assets/custom_icons/whatsapp_logo.png'),
                ),
              ),
              RSizedBox(width: 10),
              //Call Button
              InkWell(
                onTap: () => Get.bottomSheet(
                  AcnooCopyContactSheet(),
                  backgroundColor: AcnooAppColors.kWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                ),
                child: Container(
                  height: 48.h,
                  width: 48.h,
                  padding: REdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0xffF0EDFE),
                      borderRadius: BorderRadius.circular(4)),
                  child: Icon(
                    IconlyBold.call,
                    color: AcnooAppColors.kPrimaryColor700,
                  ),
                ),
              ),
              RSizedBox(width: 10),
              Expanded(
                child: RSizedBox(
                  height: 48,
                  child: TextButton(
                    onPressed: () {
                      if (controller.user == 'Guest') {
                        Get.bottomSheet(
                          buildGuestContactForm(context: buildContext),
                          isScrollControlled: true,
                          backgroundColor: AcnooAppColors.kWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                        );
                      } else {
                        Get.toNamed(
                          '/apply-rent',
                          arguments: {'property': controller.property},
                        );
                      }
                    },
                    style: AcnooButtonStyle.kPrimaryTextButton,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.user != 'Guest'
                            ? Image.asset(
                                'assets/images/acnoo_assets/custom_icons/check_done.png',
                                height: 16.h,
                                width: 16.h,
                              )
                            : Icon(IconlyBold.chat, size: 16.sp),
                        RSizedBox(width: 6),
                        Text(controller.user != 'Guest'
                            ? 'Apply For Rent'
                            : 'Contact Agent')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: (450 + 24).h,
              leading: Padding(
                padding: REdgeInsets.only(left: 12),
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: REdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AcnooAppColors.kWhite,
                    ),
                    child: Icon(UniconsLine.arrow_left),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      height: 346.h,
                      padding: REdgeInsets.only(bottom: 64),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(controller.property.imageUrl),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            4,
                            (index) => Container(
                              height: 2 * (index + 1).h,
                              width: 2 * (index + 1).h,
                              margin:
                                  REdgeInsets.only(right: index == 3 ? 0 : 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AcnooAppColors.kWhite,
                              ),
                            ),
                          ),
                          Container(
                            margin: REdgeInsets.symmetric(horizontal: 4.5),
                            padding: REdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AcnooAppColors.kPrimaryColor700,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Text(
                              '1/12',
                              style: AcnooTextStyle.kCaption.copyWith(
                                color: AcnooAppColors.kWhite,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ...List.generate(
                            4,
                            (index) => Container(
                              height: 8 + (-2 * index).h,
                              width: 8 + (-2 * index).h,
                              margin:
                                  REdgeInsets.only(right: index == 3 ? 0 : 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AcnooAppColors.kWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 346 - (64 - 16),
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: REdgeInsets.fromLTRB(24, 16, 24, 24),
                        decoration: BoxDecoration(
                          color: AcnooAppColors.kWhite,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Pricing
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rent for Apartment',
                                      style: AcnooTextStyle.kBodySm.copyWith(
                                          color:
                                              AcnooAppColors.kNeutralColor500),
                                    ),
                                    RSizedBox(height: 4),
                                    Text.rich(
                                      TextSpan(
                                        text:
                                            "\$${AcnooCommonUtils.formatNumberWithCommas(controller.property.price)} ",
                                        style: AcnooTextStyle.kBodyLg.copyWith(
                                            color:
                                                AcnooAppColors.kPrimaryColor700,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                          TextSpan(
                                            text: '/1 month',
                                            style: AcnooTextStyle.kBodySm
                                                .copyWith(
                                                    color:
                                                        AcnooAppColors
                                                            .kNeutralColor500,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                                //Favorite Buttton
                                InkWell(
                                  onTap: () => controller.favController
                                      .addToFavList(controller.property),
                                  child: Obx(() => Container(
                                        height: 24.h,
                                        width: 24.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                AcnooAppColors.kNeutralColor200,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          controller.favController.favList
                                                  .contains(controller.property)
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          size: 14.sp,
                                          color:
                                              AcnooAppColors.kPrimaryColor700,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            RSizedBox(height: 8),

                            //Title
                            Text(
                              controller.property.title,
                              style: AcnooTextStyle.kBodyLg
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            RSizedBox(height: 8),
                            //Address
                            Row(
                              children: [
                                Icon(IconlyBold.location,
                                    size: 14.sp,
                                    color: AcnooAppColors.kNeutralColor400),
                                RSizedBox(width: 4),
                                Text(
                                  controller.property.address,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AcnooTextStyle.kBodySm.copyWith(
                                      color: AcnooAppColors.kNeutralColor500),
                                )
                              ],
                            ),
                            RSizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  IconlyBold.star,
                                  size: 14.sp,
                                  color: Color(0xffFF900C),
                                ),
                                RSizedBox(width: 4),
                                Text.rich(
                                  TextSpan(
                                    text: '4.9 ',
                                    children: [
                                      TextSpan(
                                          text: '(50 reviews)',
                                          style: AcnooTextStyle.kBodySm
                                              .copyWith(
                                                  color: AcnooAppColors
                                                      .kNeutralColor500)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StickyHeader(
                  header: Container(
                    height: 56.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AcnooAppColors.kNeutralColor200,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.tabItems.length,
                          (index) => Padding(
                            padding: REdgeInsets.only(
                                left: index == 0 ? 24 : 0, right: 34),
                            child: InkWell(
                              onTap: () {
                                Scrollable.ensureVisible(
                                  controller.tabItems.values
                                      .toList()[index]
                                      .keys
                                      .first
                                      .currentContext!,
                                  curve: Curves.easeInOut,
                                  duration: Duration(milliseconds: 350),
                                );
                                controller.selectedTab.value =
                                    controller.tabItems.keys.toList()[index];
                              },
                              child: Obx(
                                () => Container(
                                  decoration: BoxDecoration(
                                    border: controller.selectedTab.value ==
                                            controller.tabItems.keys
                                                .toList()[index]
                                        ? Border(
                                            bottom: BorderSide(
                                                color: AcnooAppColors
                                                    .kPrimaryColor700),
                                          )
                                        : null,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        controller.tabItems.values
                                            .toList()[index]
                                            .values
                                            .first,
                                        size: 14.sp,
                                        color: controller.selectedTab.value ==
                                                controller.tabItems.keys
                                                    .toList()[index]
                                            ? AcnooAppColors.kPrimaryColor700
                                            : AcnooAppColors.kNeutralColor500,
                                      ),
                                      RSizedBox(height: 4),
                                      Text(
                                        controller.tabItems.keys
                                            .toList()[index],
                                        style: AcnooTextStyle.kCaption.copyWith(
                                            color:
                                                controller.selectedTab.value ==
                                                        controller.tabItems.keys
                                                            .toList()[index]
                                                    ? AcnooAppColors
                                                        .kPrimaryColor700
                                                    : AcnooAppColors
                                                        .kNeutralColor500,
                                            fontWeight: FontWeight.w600),
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
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: REdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //About Section
                            Column(
                              key: controller.aboutSectionKey,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Landlord Info
                                Container(
                                  padding: REdgeInsets.fromLTRB(10, 10, 14, 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF2F3F8),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.property.ownerName,
                                            style: AcnooTextStyle.kCaption
                                                .copyWith(fontSize: 13.sp),
                                          ),
                                          RSizedBox(height: 4),
                                          Text(
                                            'Landlord',
                                            style: AcnooTextStyle.kBodySm
                                                .copyWith(
                                                    color: AcnooAppColors
                                                        .kNeutralColor500),
                                          ),
                                          RSizedBox(height: 10),
                                          Text(
                                            'Posted On: 2 March 2023',
                                            style: AcnooTextStyle.kBodySm
                                                .copyWith(
                                                    color: AcnooAppColors
                                                        .kNeutralColor600),
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        //TODO:Add Chat functionality
                                        onTap: () => print('object'),
                                        child: Container(
                                          padding: REdgeInsets.symmetric(
                                              horizontal: 8, vertical: 6),
                                          decoration: BoxDecoration(
                                              color: AcnooAppColors
                                                  .kPrimaryColor700,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                IconlyBold.chat,
                                                size: 13.sp,
                                                color: AcnooAppColors.kWhite,
                                              ),
                                              RSizedBox(width: 4),
                                              Text(
                                                'Chat',
                                                style: AcnooTextStyle.kCaption
                                                    .copyWith(
                                                        fontSize: 13.sp,
                                                        color: AcnooAppColors
                                                            .kWhite),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                RSizedBox(height: 24),

                                //Description
                                Text(
                                  'Description',
                                  style: AcnooTextStyle.kBodyMd
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                RSizedBox(height: 24 / 2),
                                ReadMoreText(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam blandit felis vel libero varius, vel venenatis dolor consectetur. Quisque efficitur ac metus nec cursus. Vestibulum vehicula felis id justo lacinia malesuada. Vivamus non elit nec eros aliquam fringilla. Curabitur vel pharetra odio. Pellentesque fermentum est sapien, ac facilisis odio gravida vitae. Sed fermentum varius diam, quis laoreet metus varius in. Fusce nec odio at orci malesuada suscipit. Donec ut nisi quis arcu pharetra consectetur. Proin sed mi vel felis facilisis vulputate vel vel ipsum. Nam rhoncus odio velit, non fringilla neque sagittis non. Quisque pulvinar, enim nec euismod sagittis, nulla tellus laoreet eros, ac sagittis purus orci eu nisi. Integer volutpat felis non nisi ultrices, quis interdum erat bibendum. Integer et dictum mauris. Suspendisse semper mi in ipsum consectetur, vel interdum mauris vestibulum.',
                                  style: AcnooTextStyle.kBodySm.copyWith(
                                      color: AcnooAppColors.kNeutralColor600,
                                      height: 1.5.h),
                                  colorClickableText:
                                      AcnooAppColors.kPrimaryColor700,
                                  trimLength: 100,
                                  trimMode: TrimMode.Length,
                                  trimCollapsedText: ' Read More',
                                  trimExpandedText: ' show less',
                                ),
                                RSizedBox(height: 16),
                                //Description
                                Text(
                                  'Building Details',
                                  style: AcnooTextStyle.kBodyMd
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                RSizedBox(height: 24 / 2),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RSizedBox(
                                      width: 130,
                                      child: Text(
                                        'Building Name',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor600),
                                      ),
                                    ),
                                    RSizedBox(
                                        width: 190,
                                        child: Text('Arte Plus Jalan Ampang',
                                            style: AcnooTextStyle.kBodySm))
                                  ],
                                ),
                                RSizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RSizedBox(
                                      width: 130,
                                      child: Text(
                                        'Address',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor600),
                                      ),
                                    ),
                                    RSizedBox(
                                        width: 190,
                                        child: Text(
                                            'Off Jalan Ampang, Ampang, Kuala Lumpur',
                                            style: AcnooTextStyle.kBodySm))
                                  ],
                                ),
                                RSizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RSizedBox(
                                      width: 130,
                                      child: Text(
                                        'Lot Number',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor600),
                                      ),
                                    ),
                                    RSizedBox(
                                        width: 190,
                                        child: Text('38',
                                            style: AcnooTextStyle.kBodySm))
                                  ],
                                ),
                              ],
                            ),

                            //Property Types Section
                            RSizedBox(
                                key: controller.propertyTypesKey, height: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Description
                                Text(
                                  'Property Types',
                                  style: AcnooTextStyle.kBodyMd
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                RSizedBox(height: 24 / 2),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RSizedBox(
                                      width: 130,
                                      child: Text(
                                        'Residential Type',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor600),
                                      ),
                                    ),
                                    RSizedBox(
                                      width: 190,
                                      child: Text('Service Residence',
                                          style: AcnooTextStyle.kBodySm),
                                    )
                                  ],
                                ),
                                RSizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RSizedBox(
                                      width: 130,
                                      child: Text(
                                        'Furnishing',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor600),
                                      ),
                                    ),
                                    RSizedBox(
                                      width: 190,
                                      child: Text('Furnishing',
                                          style: AcnooTextStyle.kBodySm),
                                    )
                                  ],
                                ),
                                RSizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RSizedBox(
                                      width: 130,
                                      child: Text(
                                        'Bedroom',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor600),
                                      ),
                                    ),
                                    RSizedBox(
                                      width: 190,
                                      child: Text(
                                          '${controller.property.bedRooms} beds',
                                          style: AcnooTextStyle.kBodySm),
                                    )
                                  ],
                                ),
                                RSizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RSizedBox(
                                      width: 130,
                                      child: Text(
                                        'Bathroom',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor600),
                                      ),
                                    ),
                                    RSizedBox(
                                      width: 190,
                                      child: Text(
                                          '${controller.property.bathRooms} baths',
                                          style: AcnooTextStyle.kBodySm),
                                    )
                                  ],
                                ),
                                RSizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RSizedBox(
                                      width: 130,
                                      child: Text(
                                        'Property Size',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor600),
                                      ),
                                    ),
                                    RSizedBox(
                                      width: 190,
                                      child: Text(
                                          '${controller.property.flatArea} sq.ft.',
                                          style: AcnooTextStyle.kBodySm),
                                    )
                                  ],
                                ),
                                RSizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RSizedBox(
                                      width: 130,
                                      child: Text(
                                        'Rental Deposit',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor600),
                                      ),
                                    ),
                                    RSizedBox(
                                      width: 190,
                                      child: Text(
                                          '\$${AcnooCommonUtils.formatNumberWithCommas(controller.property.price)}',
                                          style: AcnooTextStyle.kBodySm),
                                    )
                                  ],
                                ),
                              ],
                            ),

                            //Features section
                            RSizedBox(key: controller.featuresKey, height: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'Features ',
                                    style: AcnooTextStyle.kBodyMd
                                        .copyWith(fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(
                                        text: '(Facilities & Amenities )',
                                        style: AcnooTextStyle.kBodyMd.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AcnooAppColors
                                                .kNeutralColor500),
                                      )
                                    ],
                                  ),
                                ),
                                RSizedBox(height: 12),

                                //Facilities
                                Text(
                                  'Facilities',
                                  style: AcnooTextStyle.kCaption
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                RSizedBox(height: 8),
                                Row(
                                  children: [
                                    buildCheckRow(
                                      title: controller.property.facilities.keys
                                          .toList()[0],
                                      value: controller
                                          .property.facilities.values
                                          .toList()[0],
                                    ),
                                    buildCheckRow(
                                      title: controller.property.facilities.keys
                                          .toList()[1],
                                      value: controller
                                          .property.facilities.values
                                          .toList()[1],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    buildCheckRow(
                                        title: controller
                                            .property.facilities.keys
                                            .toList()[2],
                                        value: controller
                                            .property.facilities.values
                                            .toList()[2]),
                                    buildCheckRow(
                                        title: controller
                                            .property.facilities.keys
                                            .toList()[3],
                                        value: controller
                                            .property.facilities.values
                                            .toList()[3])
                                  ],
                                ),
                                Row(
                                  children: [
                                    buildCheckRow(
                                        title: controller
                                            .property.facilities.keys
                                            .toList()[4],
                                        value: controller
                                            .property.facilities.values
                                            .toList()[4]),
                                    buildCheckRow(
                                        title: controller
                                            .property.facilities.keys
                                            .toList()[5],
                                        value: controller
                                            .property.facilities.values
                                            .toList()[5])
                                  ],
                                ),
                                Row(
                                  children: [
                                    buildCheckRow(
                                        title: controller
                                            .property.facilities.keys
                                            .toList()[6],
                                        value: controller
                                            .property.facilities.values
                                            .toList()[6]),
                                    buildCheckRow(
                                        title: controller
                                            .property.facilities.keys
                                            .toList()[7],
                                        value: controller
                                            .property.facilities.values
                                            .toList()[7])
                                  ],
                                ),
                                Row(
                                  children: [
                                    buildCheckRow(
                                        title: controller
                                            .property.facilities.keys
                                            .toList()[8],
                                        value: controller
                                            .property.facilities.values
                                            .toList()[8]),
                                    buildCheckRow(
                                        title: controller
                                            .property.facilities.keys
                                            .toList()[9],
                                        value: controller
                                            .property.facilities.values
                                            .toList()[9])
                                  ],
                                ),
                                RSizedBox(height: 6),

                                //Amenities
                                Text(
                                  'Amenities',
                                  style: AcnooTextStyle.kCaption
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                RSizedBox(height: 6 + 2),
                                Row(
                                  children: [
                                    buildCheckRow(
                                        title: controller
                                            .property.amenities.keys
                                            .toList()[0],
                                        value: controller
                                            .property.amenities.values
                                            .toList()[0]),
                                    buildCheckRow(
                                        title: controller
                                            .property.amenities.keys
                                            .toList()[1],
                                        value: controller
                                            .property.amenities.values
                                            .toList()[1])
                                  ],
                                ),
                                Row(
                                  children: [
                                    buildCheckRow(
                                        title: controller
                                            .property.amenities.keys
                                            .toList()[2],
                                        value: controller
                                            .property.amenities.values
                                            .toList()[2]),
                                    buildCheckRow(
                                        title: controller
                                            .property.amenities.keys
                                            .toList()[3],
                                        value: controller
                                            .property.amenities.values
                                            .toList()[3])
                                  ],
                                ),
                                buildCheckRow(
                                    title: controller.property.amenities.keys
                                        .toList()[4],
                                    value: controller.property.amenities.values
                                        .toList()[4]),
                              ],
                            ),

                            //Floor Plans
                            RSizedBox(key: controller.floorPlanKey, height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Floor Plans',
                                  style: AcnooTextStyle.kBodyMd
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                RSizedBox(height: 12),
                                Container(
                                  padding: REdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AcnooAppColors.kWhite,
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AcnooAppColors.kNeutralColor300,
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 1.5,
                                          spreadRadius: 0.5),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 50.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/demo_images/demo_floor_plan.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      RSizedBox(width: 10),
                                      Text(
                                        'Typical Floor 07-11-15 & 19',
                                        style: AcnooTextStyle.kCaption
                                            .copyWith(fontSize: 13.sp),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            RSizedBox(height: 24),

                            //Location
                            Text(
                              'Location',
                              style: AcnooTextStyle.kBodyMd
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            RSizedBox(height: 24 / 2),
                            Container(
                              height: 130.h,
                              padding: REdgeInsets.all(8),
                              alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/demo_images/demo_map_sm.png'),
                                ),
                              ),
                              child: InkWell(
                                onTap: () => Get.toNamed(
                                  '/property-map',
                                  arguments: {
                                    "title": controller.property.title
                                  },
                                ),
                                child: Container(
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                      color: AcnooAppColors.kPrimaryColor700,
                                      borderRadius: BorderRadius.circular(4)),
                                  padding: REdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        IconlyBold.location,
                                        color: AcnooAppColors.kWhite,
                                        size: 16.sp,
                                      ),
                                      RSizedBox(width: 4),
                                      Text(
                                        'View Map',
                                        style: AcnooTextStyle.kCaption.copyWith(
                                            fontSize: 13.sp,
                                            color: AcnooAppColors.kWhite,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            RSizedBox(height: 24),

                            //Video
                            Text(
                              'Video',
                              style: AcnooTextStyle.kBodyMd
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            RSizedBox(height: 24 / 2),
                            Container(
                              height: 172.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/demo_images/demo_video.png'),
                                ),
                              ),
                            ),
                            RSizedBox(height: 24),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Bottom Section
                Container(
                  width: Get.width,
                  padding: REdgeInsets.fromLTRB(24, 24, 24, 12),
                  decoration: BoxDecoration(
                    color: Color(0xffF2F3F8),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Recommended Properties
                      Container(
                        padding: REdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: AcnooAppColors.kWhite,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: REdgeInsets.all(16),
                              child: Text(
                                'Recommended Properties',
                                style: AcnooTextStyle.kBodyMd
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Row(
                                    children: List.generate(2, (index) {
                                      final property =
                                          AcnooDemoProperties.properties[index];
                                      return Padding(
                                        padding: REdgeInsets.only(
                                            left: index == 0 ? 16 : 0,
                                            right: 16),
                                        child: AcnooPropertyCard(
                                          ontap: () => Get.toNamed(
                                            '/property-details',
                                            arguments: {'property': property},
                                          ),
                                          favBtn: InkWell(
                                            onTap: () => controller
                                                .favController
                                                .addToFavList(property),
                                            child: Container(
                                              height: 20.h,
                                              width: 20.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: AcnooAppColors
                                                      .kNeutralColor200,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                controller.favController.favList
                                                        .contains(property)
                                                    ? Icons.favorite
                                                    : Icons.favorite_outline,
                                                size: 14.sp,
                                                color: AcnooAppColors
                                                    .kPrimaryColor700,
                                              ),
                                            ),
                                          ),
                                          address: property.address,
                                          bathRooms: property.bathRooms,
                                          bedRooms: property.bedRooms,
                                          flatArea: property.flatArea,
                                          rentPerMonth: property.price,
                                          title: property.title,
                                          propertyImage: property.imageUrl,
                                          landlordName: property.ownerName,
                                        ),
                                      );
                                    }),
                                  ),
                                  RSizedBox(height: 10),
                                  Row(
                                    children: List.generate(
                                      2,
                                      (index) {
                                        final property = AcnooDemoProperties
                                            .properties[index + 2];
                                        return Padding(
                                          padding: REdgeInsets.only(
                                              left: index == 0 ? 16 : 0,
                                              right: 16),
                                          child: AcnooPropertyCard(
                                            ontap: () => Get.toNamed(
                                                '/property-details',
                                                arguments: {
                                                  'property': property,
                                                }),
                                            favBtn: InkWell(
                                              onTap: () => controller
                                                  .favController
                                                  .addToFavList(property),
                                              child: Container(
                                                height: 20.h,
                                                width: 20.h,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: AcnooAppColors
                                                        .kNeutralColor200,
                                                    shape: BoxShape.circle),
                                                child: Icon(
                                                  controller
                                                          .favController.favList
                                                          .contains(property)
                                                      ? Icons.favorite
                                                      : Icons.favorite_outline,
                                                  size: 14.sp,
                                                  color: AcnooAppColors
                                                      .kPrimaryColor700,
                                                ),
                                              ),
                                            ),
                                            address: property.address,
                                            bathRooms: property.bathRooms,
                                            bedRooms: property.bedRooms,
                                            flatArea: property.flatArea,
                                            rentPerMonth: property.price,
                                            title: property.title,
                                            propertyImage: property.imageUrl,
                                            landlordName: property.ownerName,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      RSizedBox(height: 24),

                      //Reviews
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviews',
                            style: AcnooTextStyle.kBodyMd
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            //TODO: Add Review writing feature
                            child: Row(
                              children: [
                                Icon(
                                  MdiIcons.plusCircleOutline,
                                  color: AcnooAppColors.kNeutralColor500,
                                  size: 16.sp,
                                ),
                                RSizedBox(width: 4),
                                Text(
                                  'Write a review',
                                  style: AcnooTextStyle.kCaption.copyWith(
                                      fontSize: 13.sp,
                                      color: AcnooAppColors.kNeutralColor500),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      RSizedBox(height: 16),
                      ...List.generate(
                        5,
                        (index) => Padding(
                          padding: REdgeInsets.only(bottom: 16),
                          child: Container(
                            padding: REdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AcnooAppColors.kWhite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(),
                                    RSizedBox(width: 10),
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Abdul Korim',
                                                style: AcnooTextStyle.kBodyMd
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              RSizedBox(height: 4),
                                              RatingBarIndicator(
                                                itemSize: 14.sp,
                                                rating: 1.5 + index,
                                                unratedColor: AcnooAppColors
                                                    .kNeutralColor400,
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  IconlyBold.star,
                                                  color: AcnooAppColors
                                                      .kRatingStarColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            '5, June 2023',
                                            style: AcnooTextStyle.kCaption
                                                .copyWith(
                                                    fontSize: 11.sp,
                                                    color: AcnooAppColors
                                                        .kNeutralColor500),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                RSizedBox(height: 10),
                                Text(
                                  'Nibh nibh quis dolor in. Etiam cras nisi, turpis quisque diam',
                                  style: AcnooTextStyle.kBodyMd.copyWith(
                                      color: AcnooAppColors.kNeutralColor500,
                                      wordSpacing: 1.5,
                                      height: 1.5),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGuestLogin({required BuildContext context}) {
    final FocusNode passwordFieldFocus = FocusNode();
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.fromLTRB(24, 8, 24, 12),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 3.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: AcnooAppColors.kNeutralColor300,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                RSizedBox(height: 10),
                Text(
                  'Log In Now',
                  style: AcnooTextStyle.kBodyMd
                      .copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(height: 30),
            Form(
              child: Column(
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                      onFieldSubmitted: (value) => FocusScope.of(context)
                          .requestFocus(passwordFieldFocus)),
                  RSizedBox(height: 16),
                  Obx(() => TextFormField(
                        obscureText: controller.obscureText.value,
                        focusNode: passwordFieldFocus,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: '* * * * * * * *',
                            suffixIcon: InkResponse(
                              onTap: () => controller.obscureText.value =
                                  !controller.obscureText.value,
                              child: Icon(controller.obscureText.value
                                  ? IconlyBold.hide
                                  : IconlyBold.show),
                            )),
                      )),
                  RSizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => RSizedBox(
                              height: 16,
                              width: 16,
                              child: Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: (value) =>
                                    controller.rememberMe.value = value!,
                              ),
                            ),
                          ),
                          RSizedBox(width: 8),
                          Text(
                            'Remember me',
                            style: AcnooTextStyle.kBodySm.copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => Get.toNamed('/forgot-password'),
                        child: Text('Forgot password',
                            style: AcnooTextStyle.kBodySm.copyWith(
                                fontSize: 13.sp,
                                color: AcnooAppColors.kNeutralColor600,
                                fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                  RSizedBox(height: 24),
                  TextButton(
                      onPressed: () => Get.offAllNamed('/choose-your-city'),
                      style: AcnooButtonStyle.kPrimaryTextButton,
                      child: Text('Sign In')),
                  RSizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text: 'Are Your New Here? ',
                      style: AcnooTextStyle.kBodySm
                          .copyWith(color: AcnooAppColors.kNeutralColor600),
                      children: [
                        TextSpan(
                          text: 'Create an account',
                          style: AcnooTextStyle.kBodySm.copyWith(
                              color: AcnooAppColors.kPrimaryColor700,
                              fontWeight: FontWeight.w600),

                          //TODO: Navigate to home screen when home screen is completed
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.offAndToNamed('/signup'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGuestContactForm({required BuildContext context}) {
    AcnooCountryService.getCountries();
    final TextEditingController mobileNumController = TextEditingController();
    RxBool agreed = false.obs;
    List<String> countryCodes = ['+880', '+91', '+1', '+92'];
    RxString selectedCountryCode = '+880'.obs;

    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.fromLTRB(24, 8, 24, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: 3.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: AcnooAppColors.kNeutralColor300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  RSizedBox(height: 10),
                  Text(
                    'Contact Agent',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(height: 24),
            Text('Your contact Information', style: AcnooTextStyle.kBodyMd),
            SizedBox(height: 16),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter your full name'),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email', hintText: 'Enter your email'),
                  ),
                  SizedBox(height: 16),
                  InputDecorator(
                    decoration: InputDecoration(
                        contentPadding: REdgeInsets.only(left: 12.0),
                        labelText: 'Mobile Number'),
                    child: TextFormField(
                      controller: mobileNumController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: AcnooInputDecoration.kUnstyledInputDecoration
                          .copyWith(
                        counterText: '',
                        hintText: '132465978',
                        prefixIcon: DropdownButtonHideUnderline(
                          child: Obx(
                            () => DropdownButton2(
                              value: selectedCountryCode.value,
                              selectedItemBuilder: (context) => countryCodes
                                  .map(
                                    (data) => DropdownMenuItem(
                                      child: Text(data,
                                          style: AcnooTextStyle.kBodySm),
                                    ),
                                  )
                                  .toList(),
                              items: List.generate(
                                countryCodes.length,
                                (index) => DropdownMenuItem(
                                  child: Text(countryCodes[index]),
                                  value: countryCodes[index],
                                ),
                              ),
                              onChanged: (value) =>
                                  selectedCountryCode.value = value!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        labelText: 'Message', hintText: 'Enter message'),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Obx(
                        () => RSizedBox(
                          height: 16,
                          width: 16,
                          child: Checkbox(
                            value: agreed.value,
                            onChanged: (value) => agreed.value = value!,
                          ),
                        ),
                      ),
                      RSizedBox(width: 8),
                      Text.rich(
                        TextSpan(
                          text: 'I agree with ',
                          style: AcnooTextStyle.kBodySm.copyWith(
                              fontSize: 13.sp, fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                text: 'Terms Conditions',
                                style: AcnooTextStyle.kBodySm.copyWith(
                                    color: AcnooAppColors.kPrimaryColor700),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => Get.toNamed('/terms-conditions'))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  TextButton(
                    onPressed: () {},
                    style: AcnooButtonStyle.kPrimaryTextButton,
                    child: Text('Send Request'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCheckRow({required String title, required bool value}) {
    return Container(
      margin: REdgeInsets.only(bottom: 10),
      width: 150.w,
      child: Row(
        children: [
          Icon(MdiIcons.checkboxMarkedCircleOutline,
              size: 16.sp,
              color: value
                  ? AcnooAppColors.kPrimaryColor700
                  : AcnooAppColors.kNeutralColor500),
          RSizedBox(width: 10),
          Text(
            title,
            style: AcnooTextStyle.kBodySm
                .copyWith(color: AcnooAppColors.kNeutralColor600),
          )
        ],
      ),
    );
  }
}
