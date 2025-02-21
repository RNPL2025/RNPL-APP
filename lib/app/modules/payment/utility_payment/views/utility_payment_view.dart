import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../widgets/common_widgets.dart';
import '../controllers/utility_payment_controller.dart';

class UtilityPaymentView extends GetView<UtilityPaymentController> {
  const UtilityPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Utility Payment'), centerTitle: false),
      body: AcnooScaffoldContainer(
        bodyBgColor: Color(0xfff2f3f8),
        child: ListView.builder(
          padding: REdgeInsets.all(24),
          itemCount: 3,
          itemBuilder: (context, index) => AcnooPaymentCard(
              status: index == 0
                  ? 'Unpaid'
                  : index == 1
                      ? 'Paid'
                      : 'Pending'),
        ),
      ),
    );
  }
}
