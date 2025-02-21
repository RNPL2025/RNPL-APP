import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';

import '../controllers/refund_request_controller.dart';

class RefundRequestView extends GetView<RefundRequestController> {
  const RefundRequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Refund Request'), centerTitle: false, titleSpacing: 0),
      bottomNavigationBar: Container(
        padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
        color: AcnooAppColors.kWhite,
        child: TextButton(
            onPressed: () {},
            style: AcnooButtonStyle.kPrimaryTextButton,
            child: Text('Continue')),
      ),
      body: AcnooScaffoldContainer(
        child: Form(
          child: ListView(
            padding: REdgeInsets.all(24),
            children: [
              DropdownButtonFormField2(
                decoration: InputDecoration(
                    labelText: 'Property', hintText: 'Select property'),
                items: List.generate(
                  5,
                  (index) => DropdownMenuItem(
                    child: Text('Property #$index'),
                    value: (index + 1),
                  ),
                ),
                onChanged: (value) {},
              ),
              RSizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Refund Amount', hintText: 'Enter amount'),
              ),
              RSizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                    labelText: 'Reason', hintText: 'Enter reason'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
