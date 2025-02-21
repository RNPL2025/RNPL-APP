import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:rentpro/app/data/property/property.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';

import '../controllers/applications_controller.dart';

class ApplicationsView extends GetView<ApplicationsController> {
  const ApplicationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Applications'), centerTitle: false),
      body: AcnooScaffoldContainer(
        topBarBgColor: AcnooAppColors.kWhite,
        bodyBgColor: AcnooAppColors.kScaffoldBackground,
        topBar: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: AcnooAppColors.kNeutralColor200, width: 1.5),
            ),
          ),
          child: TabBar(
            controller: controller.tabController,
            labelColor: AcnooAppColors.kPrimaryColor700,
            unselectedLabelColor: AcnooAppColors.kNeutralColor500,
            indicatorColor: AcnooAppColors.kPrimaryColor700,
            tabs: [
              Tab(child: Text('Pending')),
              Tab(child: Text('Approved')),
              Tab(child: Text('Rejected')),
            ],
          ),
        ),
        child: TabBarView(controller: controller.tabController, children: [
          StatusTab(status: 'Pending'),
          StatusTab(status: 'Approved'),
          StatusTab(status: 'Rejected'),
        ]),
      ),
    );
  }
}

class StatusTab extends GetView<ApplicationsController> {
  const StatusTab({Key? key, required this.status}) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: REdgeInsets.fromLTRB(24, 16, 24, 12),
        itemCount: controller.demoPropertyList.length,
        itemBuilder: (context, index) {
          final AcnooPropertyModel property =
              controller.demoPropertyList[index];
          return Padding(
            padding: REdgeInsets.only(bottom: 16),
            child: Container(
              padding: REdgeInsets.fromLTRB(8, 8, 8, 12),
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
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(property.imageUrl),
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
                                            "\$${AcnooCommonUtils.formatNumberWithCommas(property.price)} ",
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
                                  status,
                                  style: AcnooTextStyle.kBodySm.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: status == 'Pending'
                                        ? AcnooAppColors.kWarningMain
                                        : status == 'Approved'
                                            ? AcnooAppColors.kPrimaryColor700
                                            : AcnooAppColors.kSecondaryColor700,
                                  ),
                                )
                              ],
                            ),
                            RSizedBox(height: 2),
                            Text(
                              property.title,
                              style: AcnooTextStyle.kCaption.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AcnooAppColors.kNeutralColor900),
                            ),
                            Container(
                              height: 0.5,
                              margin: REdgeInsets.symmetric(vertical: 4),
                              color: AcnooAppColors.kNeutralColor200,
                            ),
                            Text.rich(
                              TextSpan(
                                  text: 'Landlord:  ',
                                  style: AcnooTextStyle.kCaption.copyWith(
                                      color: AcnooAppColors.kNeutralColor500),
                                  children: [
                                    TextSpan(
                                      text: property.ownerName,
                                      style: AcnooTextStyle.kCaption.copyWith(
                                          color:
                                              AcnooAppColors.kNeutralColor900,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(vertical: 10),
                    child: DottedBorder(
                      padding: EdgeInsets.zero,
                      dashPattern: [2, 4],
                      color: AcnooAppColors.kNeutralColor200,
                      child: Container(
                        width: Get.width,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AcnooInitialsAvatar(
                            firstName: 'Arlene',
                            lastName: 'McCoy',
                            size: 36,
                            backgroundColor: AcnooAppColors.kPrimaryColor700,
                          ),
                          RSizedBox(width: 10),
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
                                style: AcnooTextStyle.kCaption.copyWith(
                                    color: AcnooAppColors.kNeutralColor500),
                              )
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          switch (status) {
                            case "Approved":
                              {
                                Get.toNamed('/application-details', arguments: {
                                  'property': property,
                                  'status': 'Approved'
                                });
                              }
                            case "Pending":
                              {
                                Get.toNamed('/application-details', arguments: {
                                  'property': property,
                                  'status': 'Pending'
                                });
                              }
                            case "Rejected":
                              {
                                Get.toNamed('/application-details', arguments: {
                                  'property': property,
                                  'status': 'Rejected'
                                });
                              }
                          }
                        },
                        child: Container(
                          height: 32.h,
                          padding:
                              REdgeInsets.symmetric(horizontal: 9, vertical: 4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AcnooAppColors.kScaffoldBackground,
                              border: Border.all(
                                  color: AcnooAppColors.kPrimaryColor700),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            'View Details',
                            style: AcnooTextStyle.kBodySm.copyWith(
                                color: AcnooAppColors.kPrimaryColor700,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
