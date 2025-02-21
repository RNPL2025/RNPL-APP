import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';
import 'package:unicons/unicons.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'), centerTitle: false),
      body: AcnooScaffoldContainer(
        topBar: Padding(
          padding: REdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildOverviewCard(
                    backgroundColor: Color(0xffFFA11B),
                    title: 'Number of Application',
                    body: '20',
                    statusTitle: 'Accepted',
                    statusValue: '16',
                  ),
                  RSizedBox(width: 16),
                  buildOverviewCard(
                    backgroundColor: Color(0xff02C0C0),
                    title: 'Pending Rent Amount',
                    body: '\$30000',
                    statusTitle: 'This Month',
                    statusValue: '\$15000',
                  )
                ],
              ),
              RSizedBox(height: 16),
              Row(
                children: [
                  buildOverviewCard(
                    backgroundColor: Color(0xff0480FA),
                    title: 'Pending Maintenance',
                    body: '2000',
                    statusTitle: 'Accepted',
                    statusValue: '\$10000',
                  ),
                  RSizedBox(width: 16),
                  buildOverviewCard(
                    backgroundColor: Color(0xffF23B3D),
                    title: 'Unpaid Utility Payment',
                    body: '\$500',
                    statusTitle: 'This Month',
                    statusValue: '\$2000',
                  )
                ],
              ),
            ],
          ),
        ),
        child: Container(
          width: Get.width,
          padding: REdgeInsets.all(24),
          decoration: BoxDecoration(
              color: AcnooAppColors.kScaffoldBackground,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: Column(
            children: [
              Container(
                padding: REdgeInsets.fromLTRB(10, 10, 10, 47),
                decoration: BoxDecoration(
                  color: AcnooAppColors.kWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 38.h,
                      padding: REdgeInsets.only(left: 20, right: 0.5),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AcnooAppColors.kWhite,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: AcnooAppColors.kNeutralColor300,
                              blurStyle: BlurStyle.outer,
                              blurRadius: 1.5,
                              spreadRadius: 0.5),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Maintenance Request',
                            style: AcnooTextStyle.kBodySm
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Container(
                            padding: REdgeInsets.symmetric(
                                horizontal: 18, vertical: 8),
                            decoration: BoxDecoration(
                              color: AcnooAppColors.kScaffoldBackground,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Obx(
                                () => DropdownButton(
                                  style: AcnooTextStyle.kBodySm.copyWith(
                                      color: AcnooAppColors.kPrimaryColor700),
                                  icon: Icon(UniconsLine.angle_down),
                                  iconSize: 16.sp,
                                  iconEnabledColor:
                                      AcnooAppColors.kPrimaryColor700,
                                  value: controller.selectedFrequency.value,
                                  items: List.generate(
                                    controller.frequencyFilter.length,
                                    (index) => DropdownMenuItem(
                                      child: Text(
                                          controller.frequencyFilter[index]),
                                      value: controller.frequencyFilter[index],
                                    ),
                                  ),
                                  onChanged: (value) => controller
                                      .selectedFrequency.value = value!,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RSizedBox(height: 38),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: List.generate(
                              controller.chartData.length,
                              (index) => buildChartOverviewRow(
                                  title: controller.chartData[index].title,
                                  value:
                                      "${(controller.chartData[index].value * 100).toStringAsFixed(0)}",
                                  dotColor: controller.chartData[index].color),
                            ),
                          ),

                          //TODO:Fix the chart's section rounded corner
                          Container(
                            height: 86.h,
                            width: 86.w,
                            margin: REdgeInsets.only(right: 24),
                            child: PieChart(
                              PieChartData(
                                  sectionsSpace: 0,
                                  borderData: FlBorderData(show: false),
                                  sections: controller.getSection(),
                                  centerSpaceRadius: (86 / 3).r),
                            ),
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
      ),
    );
  }

  Widget buildOverviewCard(
      {required String title,
      required String body,
      required String statusTitle,
      required String statusValue,
      Color? backgroundColor}) {
    return Expanded(
      child: Container(
        width: 156.w,
        padding: REdgeInsets.symmetric(horizontal: 6, vertical: 10),
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.blueAccent,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Text(
              title,
              style: AcnooTextStyle.kBodySm.copyWith(
                  color: AcnooAppColors.kWhite, fontWeight: FontWeight.w500),
            ),
            RSizedBox(height: 16),
            Text(
              body,
              style: AcnooTextStyle.kHeading3
                  .copyWith(fontSize: 22.sp, color: AcnooAppColors.kWhite),
            ),
            RSizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  statusTitle,
                  style: AcnooTextStyle.kCaption.copyWith(
                      color: AcnooAppColors.kWhite,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  statusValue,
                  style: AcnooTextStyle.kCaption.copyWith(
                      color: AcnooAppColors.kWhite,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildChartOverviewRow(
      {required String title, required String value, Color? dotColor}) {
    return Container(
      width: 137.w,
      margin: REdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Badge(
                backgroundColor: dotColor,
              ),
              RSizedBox(width: 14),
              Text(
                title,
                style: AcnooTextStyle.kBodyMd
                    .copyWith(color: AcnooAppColors.kNeutralColor600),
              ),
            ],
          ),
          Text(
            value,
            style: AcnooTextStyle.kBodyMd.copyWith(fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
