import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final List<String> frequencyFilter = [
    'This Month',
    'Last Month',
    'This Year',
    'Last Year'
  ];
  RxString selectedFrequency = 'This Month'.obs;

  RxInt touchedIndex = RxInt(-1);

  List<AcnooChartModel> chartData = [
    AcnooChartModel(title: 'Total', value: 0.35, color: Color(0xffEE3E3C)),
    AcnooChartModel(title: 'Pending', value: 0.10, color: Color(0xffFFA800)),
    AcnooChartModel(title: 'Approved', value: 0.25, color: Color(0xFF6200EA)),
  ];

  List<PieChartSectionData> getSection() => chartData.map((data) {
        return PieChartSectionData(
          color: data.color,
          radius: (86 / 3).r,
          value: data.value,
          showTitle: false,
        );
      }).toList();
}

class AcnooChartModel {
  final String title;
  final double value;
  final Color color;

  AcnooChartModel({
    required this.title,
    required this.value,
    required this.color,
  });
}
