import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../widgets/common_widgets.dart';
import '../../../../widgets/constants.dart';
import '../controllers/offline_payment_controller.dart';

class OfflinePaymentView extends GetView<OfflinePaymentController> {
  const OfflinePaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Offline Payment'), centerTitle: false, titleSpacing: 0),
      bottomNavigationBar: Container(
        color: AcnooAppColors.kWhite,
        padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: TextButton(
          onPressed: () => controller.handleSubmitButton(),
          style: AcnooButtonStyle.kPrimaryTextButton,
          child: Text('Submit '),
        ),
      ),
      body: AcnooScaffoldContainer(
        child: ListView(
          padding: REdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            Text(
              'Landlord Account Bank',
              style: AcnooTextStyle.kHeading3
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            RSizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.radio_button_checked,
                    size: 16.sp, color: AcnooAppColors.kPrimaryColor700),
                RSizedBox(width: 8),
                Container(
                  height: 27.h,
                  width: 98.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AcnooAppColors.kNeutralColor300, width: 1.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset('assets/images/demo_images/demo_bank.png'),
                )
              ],
            ),
            RSizedBox(height: 24),
            Row(
              children: [
                RSizedBox(
                  width: 57 + 50,
                  child: Text(
                    'Nominee',
                    style: AcnooTextStyle.kBodySm.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AcnooAppColors.kNeutralColor500),
                  ),
                ),
                Text('FIRDAUS GROUP SDN BHD', style: AcnooTextStyle.kBodySm)
              ],
            ),
            RSizedBox(height: 12),
            Row(
              children: [
                RSizedBox(
                  width: 57 + 50,
                  child: Text(
                    'No. Account',
                    style: AcnooTextStyle.kBodySm.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AcnooAppColors.kNeutralColor500),
                  ),
                ),
                Text('562548543851', style: AcnooTextStyle.kBodySm)
              ],
            ),
            RSizedBox(height: 24),
            Form(
              child: Column(
                children: [
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      labelText: 'Payment Method',
                    ),
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(color: AcnooAppColors.kNeutralColor500),
                    value: 'Internet Banking',
                    items: [
                      DropdownMenuItem(
                        child: Text('Internet Banking'),
                        value: 'Internet Banking',
                      ),
                      DropdownMenuItem(
                        child: Text('Cash Deposit Machine'),
                        value: 'Cash Deposit Machine',
                      )
                    ],
                    onChanged: (value) {},
                  ),
                  RSizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.timePickerController,
                          onTap: () => controller.pickTime(),
                          readOnly: true,
                          style: AcnooTextStyle.kBodyMd
                              .copyWith(color: AcnooAppColors.kNeutralColor600),
                          decoration: InputDecoration(
                              labelText: 'Payment Time',
                              hintText: 'Pick Time',
                              suffixIcon: Icon(MdiIcons.clockOutline)),
                        ),
                      ),
                      RSizedBox(width: 17),
                      Expanded(
                        child: TextFormField(
                          controller: controller.datePickerController,
                          onTap: () => controller.pickDate(),
                          style: AcnooTextStyle.kBodyMd
                              .copyWith(color: AcnooAppColors.kNeutralColor600),
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Payment Date',
                            hintText: 'Pick Date',
                            suffixIcon: Icon(IconlyLight.calendar),
                          ),
                        ),
                      )
                    ],
                  ),
                  RSizedBox(height: 20),
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        labelText: 'Payment Note',
                        hintText: 'Enter some text...'),
                  ),
                  RSizedBox(height: 20),
                  InputDecorator(
                    decoration: InputDecoration(
                        labelText: 'Upload Payment',
                        contentPadding: REdgeInsets.fromLTRB(18, 6, 6, 6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upload your payment',
                          style: AcnooTextStyle.kBodyMd
                              .copyWith(color: AcnooAppColors.kNeutralColor600),
                        ),
                        Container(
                          height: 38.h,
                          width: 38.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AcnooAppColors.kPrimaryColor700
                                .withOpacity(0.15),
                          ),
                          child: Icon(
                            FeatherIcons.upload,
                            size: 18.sp,
                            color: AcnooAppColors.kPrimaryColor700,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
