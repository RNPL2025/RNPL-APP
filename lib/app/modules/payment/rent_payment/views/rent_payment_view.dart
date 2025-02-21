import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:rentpro/app/widgets/common_widgets.dart';

import '../controllers/rent_payment_controller.dart';

class RentPaymentView extends GetView<RentPaymentController> {
  const RentPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rent Payments'), centerTitle: false),
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
