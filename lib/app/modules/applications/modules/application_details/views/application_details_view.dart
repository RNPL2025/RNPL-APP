import 'package:expansion_widget/expansion_widget.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:unicons/unicons.dart';

import '../../../../../widgets/common_widgets.dart';
import '../../../../../widgets/constants.dart';
import '../controllers/application_details_controller.dart';

class ApplicationDetailsView extends GetView<ApplicationDetailsController> {
  const ApplicationDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            AcnooInitialsAvatar(
              firstName: 'Arlene',
              lastName: 'McCoy',
              backgroundColor: AcnooAppColors.kPrimaryColor700,
            ),
            RSizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Arlene McCoy',
                  style: AcnooTextStyle.kBodySm
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                RSizedBox(height: 2),
                Text(
                  'Apply Date: 25 May 2023',
                  style: AcnooTextStyle.kCaption
                      .copyWith(color: AcnooAppColors.kNeutralColor500),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: AcnooAppColors.kWhite,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: TextButton(
          onPressed: () {},
          style: AcnooButtonStyle.kSecondaryButton.copyWith(
            foregroundColor: MaterialStateProperty.all(
                controller.args['status'] != 'Approved'
                    ? AcnooAppColors.kDangerMain
                    : AcnooAppColors.kPrimaryColor700),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                    color: controller.args['status'] != 'Approved'
                        ? AcnooAppColors.kDangerMain
                        : AcnooAppColors.kPrimaryColor700,
                    width: 1.5.w),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          child: Text(controller.args['status'] == 'Approved'
              ? 'Cancel'
              : controller.args['status'] == 'Pending'
                  ? 'Cancel'
                  : 'Try Again'),
        ),
      ),
      body: AcnooScaffoldContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Selected Property
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Container(
                  padding: REdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AcnooAppColors.kWhite,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: AcnooAppColors.kNeutralColor300,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 1.5,
                          spreadRadius: 0.5),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(controller.property.imageUrl),
                          ),
                        ),
                      ),
                      RSizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rent for Apartments',
                                      style: AcnooTextStyle.kCaption.copyWith(
                                          fontSize: 10.sp,
                                          color:
                                              AcnooAppColors.kNeutralColor600),
                                    ),
                                    RSizedBox(height: 2),
                                    Text.rich(
                                      TextSpan(
                                        text:
                                            "\$${AcnooCommonUtils.formatNumberWithCommas(controller.property.price)} ",
                                        style: AcnooTextStyle.kBodyMd.copyWith(
                                            color:
                                                AcnooAppColors.kPrimaryColor700,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                          TextSpan(
                                            text: '/1 month',
                                            style: AcnooTextStyle.kBodySm
                                                .copyWith(
                                                    fontSize: 10.sp,
                                                    color:
                                                        AcnooAppColors
                                                            .kNeutralColor500,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  controller.args['status'],
                                  style: AcnooTextStyle.kBodySm.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: controller.args['status'] ==
                                            'Pending'
                                        ? AcnooAppColors.kWarningMain
                                        : controller.args['status'] ==
                                                'Approved'
                                            ? AcnooAppColors.kPrimaryColor700
                                            : AcnooAppColors.kSecondaryColor700,
                                  ),
                                )
                              ],
                            ),
                            RSizedBox(height: 4),
                            Text(
                              controller.property.title,
                              style: AcnooTextStyle.kCaption
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Container(
                              height: 1.h,
                              margin: REdgeInsets.symmetric(vertical: 4),
                              color: AcnooAppColors.kNeutralColor300,
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'Landlord: ',
                                style: AcnooTextStyle.kCaption.copyWith(
                                    color: AcnooAppColors.kNeutralColor600),
                                children: [
                                  TextSpan(
                                    text: controller.property.ownerName,
                                    style: AcnooTextStyle.kCaption.copyWith(
                                        color: AcnooAppColors.kNeutralColor900),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              StickyHeader(
                header: Container(
                  width: Get.width,
                  padding: REdgeInsets.fromLTRB(24, 20, 24, 12),
                  decoration: BoxDecoration(
                    color: Color(0xffF2F3F8),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.args['status'] == 'Rejected'
                          ? Container(
                              padding: REdgeInsets.all(8),
                              margin: REdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                  color: Color(0xffFFEBEB),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    FeatherIcons.alertCircle,
                                    size: 16.sp,
                                    color: AcnooAppColors.kDangerMain,
                                  ),
                                  RSizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your Property has been rejected',
                                        style: AcnooTextStyle.kBodySm.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      RSizedBox(height: 4),
                                      RSizedBox(
                                        width: 287,
                                        child: Text(
                                          'Thanks for your apply. We have completed our review of "4 BHK Independent Builder Floor" and unfortun-ately we don’t accepted your request.',
                                          style: AcnooTextStyle.kCaption
                                              .copyWith(
                                                  color: AcnooAppColors
                                                      .kNeutralColor500),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : SizedBox(),
                      Text(
                        'Tenant Details',
                        style: AcnooTextStyle.kBodyLg
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: REdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Color(0xffF2F3F8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Basic info section
                      Container(
                        decoration: BoxDecoration(
                            color: AcnooAppColors.kWhite,
                            borderRadius: BorderRadius.circular(8)),
                        child: ExpansionWidget(
                          initiallyExpanded: true,
                          titleBuilder: (animationValue, easeInValue,
                                  isExpanded, toggleFunction) =>
                              Padding(
                            padding: REdgeInsets.fromLTRB(10, 12, 14, 12),
                            child: InkWell(
                              onTap: () => toggleFunction(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Basic Info',
                                    style: AcnooTextStyle.kBodyMd
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    isExpanded
                                        ? UniconsLine.minus_circle
                                        : UniconsLine.plus_circle,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                          content: Padding(
                            padding: REdgeInsets.fromLTRB(10, 4, 0, 10),
                            child: Column(
                              children: [
                                buildInfoRow(
                                    title: 'Full Name', value: 'Shaidul islam'),
                                buildInfoRow(
                                    title: 'Email',
                                    value: 'shaidslam1245@gmail.com'),
                                buildInfoRow(
                                    title: 'Mobile Number',
                                    value: '+880 1034251-1118'),
                                buildInfoRow(
                                    title: 'Country', value: 'Bangladesh'),
                                buildInfoRow(
                                    title: 'Address',
                                    value:
                                        'New Riends Coiony, Dhaka, Dhanmondi'),
                                buildInfoRow(title: 'City', value: 'Dhaka'),
                                buildInfoRow(
                                    title: 'State', value: 'Dhanmondi'),
                                buildInfoRow(
                                    title: 'Postal Code', value: '32610'),
                                buildInfoRow(title: 'Gender', value: 'Male'),
                                buildInfoRow(
                                    title: 'NID/Passport Num.',
                                    value: '60 034251-1118 21'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      RSizedBox(height: 18),

                      //Nominee's info Section
                      Container(
                        decoration: BoxDecoration(
                            color: AcnooAppColors.kWhite,
                            borderRadius: BorderRadius.circular(8)),
                        child: ExpansionWidget(
                          titleBuilder: (animationValue, easeInValue,
                                  isExpanded, toggleFunction) =>
                              Padding(
                            padding: REdgeInsets.fromLTRB(10, 12, 14, 12),
                            child: InkWell(
                              onTap: () => toggleFunction(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: 'Nominee ',
                                      style: AcnooTextStyle.kBodyMd.copyWith(
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: '(Optional)',
                                            style: AcnooTextStyle.kBodyMd
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AcnooAppColors
                                                        .kNeutralColor500))
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    isExpanded
                                        ? UniconsLine.minus_circle
                                        : UniconsLine.plus_circle,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                          content: Padding(
                              padding: REdgeInsets.fromLTRB(10, 4, 10, 10),
                              child: Column(
                                children: [
                                  buildInfoRow(
                                      title: 'Nominee Name',
                                      value: 'Ashley M. Sanderlin'),
                                  buildInfoRow(
                                      title: 'Nominee Email',
                                      value: 'ashley1998@example.com'),
                                  buildInfoRow(
                                      title: 'Nominee Mob. Num.',
                                      value: '+1 279-972-9347'),
                                ],
                              )),
                        ),
                      ),
                      RSizedBox(height: 18),

                      //Emergency Contact
                      Container(
                        decoration: BoxDecoration(
                            color: AcnooAppColors.kWhite,
                            borderRadius: BorderRadius.circular(8)),
                        child: ExpansionWidget(
                          titleBuilder: (animationValue, easeInValue,
                                  isExpanded, toggleFunction) =>
                              Padding(
                            padding: REdgeInsets.fromLTRB(10, 12, 14, 12),
                            child: InkWell(
                              onTap: () => toggleFunction(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Emergency Contact',
                                    style: AcnooTextStyle.kBodyMd
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    isExpanded
                                        ? UniconsLine.minus_circle
                                        : UniconsLine.plus_circle,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                          content: Padding(
                              padding: REdgeInsets.fromLTRB(10, 4, 10, 10),
                              child: Column(
                                children: [
                                  buildInfoRow(
                                      title: 'Relation With You',
                                      value: 'Friend'),
                                  buildInfoRow(
                                      title: 'Full Name',
                                      value: 'Sandy J. Goss'),
                                  buildInfoRow(
                                      title: 'Mobile Number',
                                      value: '+1 505-208-7348'),
                                ],
                              )),
                        ),
                      ),
                      RSizedBox(height: 18),

                      //Workplace (Optional)
                      Container(
                        decoration: BoxDecoration(
                            color: AcnooAppColors.kWhite,
                            borderRadius: BorderRadius.circular(8)),
                        child: ExpansionWidget(
                          titleBuilder: (animationValue, easeInValue,
                                  isExpanded, toggleFunction) =>
                              Padding(
                            padding: REdgeInsets.fromLTRB(10, 12, 14, 12),
                            child: InkWell(
                              onTap: () => toggleFunction(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: 'Workplace ',
                                      style: AcnooTextStyle.kBodyMd.copyWith(
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: '(Optional)',
                                            style: AcnooTextStyle.kBodyMd
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AcnooAppColors
                                                        .kNeutralColor500))
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    isExpanded
                                        ? UniconsLine.minus_circle
                                        : UniconsLine.plus_circle,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                          content: Padding(
                              padding: REdgeInsets.fromLTRB(10, 4, 10, 10),
                              child: Column(
                                children: [
                                  buildInfoRow(
                                      title: 'Company name',
                                      value: 'Acnoo Ltd.'),
                                  buildInfoRow(
                                      title: 'Address',
                                      value: 'Linus Sebastian'),
                                  buildInfoRow(
                                      title: 'Office Phone Num.',
                                      value: '+880 1064251-1118'),
                                  buildInfoRow(
                                      title: 'Office Mobile Num.',
                                      value: '+880 1064251-1118'),
                                  buildInfoRow(
                                      title: 'Email Address',
                                      value: 'infor@gmail.com'),
                                ],
                              )),
                        ),
                      ),
                      RSizedBox(height: 18),

                      //Vehicles Information (Optional)
                      Container(
                        decoration: BoxDecoration(
                            color: AcnooAppColors.kWhite,
                            borderRadius: BorderRadius.circular(8)),
                        child: ExpansionWidget(
                          titleBuilder: (animationValue, easeInValue,
                                  isExpanded, toggleFunction) =>
                              Padding(
                            padding: REdgeInsets.fromLTRB(10, 12, 14, 12),
                            child: InkWell(
                              onTap: () => toggleFunction(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: 'Vehicles Information ',
                                      style: AcnooTextStyle.kBodyMd.copyWith(
                                          fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                            text: '(Optional)',
                                            style: AcnooTextStyle.kBodyMd
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AcnooAppColors
                                                        .kNeutralColor500))
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    isExpanded
                                        ? UniconsLine.minus_circle
                                        : UniconsLine.plus_circle,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                          content: Padding(
                              padding: REdgeInsets.fromLTRB(10, 4, 10, 10),
                              child: Column(
                                children: [
                                  buildInfoRow(
                                      title: 'Vehicles Type', value: 'Car'),
                                  buildInfoRow(
                                      title: 'Registration No',
                                      value: 'A4DJIC2'),
                                  buildInfoRow(
                                      title: 'Vehicles Brand', value: 'BMW'),
                                ],
                              )),
                        ),
                      ),
                      RSizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow({required String title, required String value}) {
    return Container(
      margin: REdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RSizedBox(
            width: 140,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AcnooTextStyle.kBodySm
                      .copyWith(color: AcnooAppColors.kNeutralColor600),
                ),
                Text(':   ', style: AcnooTextStyle.kBodySm)
              ],
            ),
          ),
          Expanded(
            child: Text(
              '$value',
              style: AcnooTextStyle.kBodySm,
            ),
          ),
        ],
      ),
    );
  }
}
