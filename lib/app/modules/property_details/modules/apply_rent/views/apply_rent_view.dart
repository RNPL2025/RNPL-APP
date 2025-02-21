import 'package:expansion_widget/expansion_widget.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:unicons/unicons.dart';

import '../controllers/apply_rent_controller.dart';

class ApplyRentView extends GetView<ApplyRentController> {
  const ApplyRentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apply For Rent'), centerTitle: false),
      bottomNavigationBar: Container(
        padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: AcnooAppColors.kWhite,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: TextButton(
            onPressed: () => showDialog(
                  context: context,
                  builder: (popupContext) => applyDonePopup(),
                ),
            style: AcnooButtonStyle.kPrimaryTextButton,
            child: Text('Apply For The Property')),
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
                            Text(
                              'Rent for Apartments',
                              style: AcnooTextStyle.kCaption.copyWith(
                                  fontSize: 10.sp,
                                  color: AcnooAppColors.kNeutralColor600),
                            ),
                            RSizedBox(height: 2),
                            Text.rich(
                              TextSpan(
                                text:
                                    "\$${AcnooCommonUtils.formatNumberWithCommas(controller.property.price)} ",
                                style: AcnooTextStyle.kBodyMd.copyWith(
                                    color: AcnooAppColors.kPrimaryColor700,
                                    fontWeight: FontWeight.w600),
                                children: [
                                  TextSpan(
                                    text: '/1 month',
                                    style: AcnooTextStyle.kBodySm.copyWith(
                                        fontSize: 10.sp,
                                        color: AcnooAppColors.kNeutralColor500,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
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
                      Text(
                        'Tenant Agreement',
                        style: AcnooTextStyle.kBodyLg
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      RSizedBox(height: 4),
                      Text(
                        'Please fill out the form before applying.',
                        style: AcnooTextStyle.kCaption
                            .copyWith(color: AcnooAppColors.kNeutralColor600),
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
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Nominee Name',
                                        hintText: 'Enter name'),
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Nominee Email',
                                        hintText: 'Enter email'),
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Nominee Mobile Number',
                                        hintText: 'Enter mobile number'),
                                  )
                                ],
                              ),
                            ),
                          ),
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
                            child: Form(
                              child: Column(
                                children: [
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Relation With You',
                                        hintText: 'Select relation with you'),
                                    items: List.generate(
                                        controller.relationWithYou.length,
                                        (index) => DropdownMenuItem(
                                              child: Text(controller
                                                  .relationWithYou[index]),
                                              value: controller
                                                  .relationWithYou[index],
                                            )),
                                    onChanged: (value) {},
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Full Name',
                                        hintText: 'Enter name'),
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Mobile Number',
                                        hintText: 'Enter mobile number'),
                                  )
                                ],
                              ),
                            ),
                          ),
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
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Company name',
                                        hintText: 'Enter company name'),
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Address',
                                        hintText: 'Enter address'),
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Office Phone Number',
                                        hintText: 'Enter office phone number'),
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Office Mobile Number',
                                        hintText: 'Enter office mobile number'),
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        hintText: 'Enter email address'),
                                  )
                                ],
                              ),
                            ),
                          ),
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
                            child: Form(
                              child: Column(
                                children: [
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Vehicles Type',
                                        hintText: 'Select vehicles type'),
                                    items: List.generate(
                                        controller.vehiclesType.length,
                                        (index) => DropdownMenuItem(
                                              child: Text(controller
                                                  .vehiclesType[index]),
                                              value: controller
                                                  .vehiclesType[index],
                                            )),
                                    onChanged: (value) {},
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Registration No',
                                        hintText: 'Enter registration no.'),
                                  ),
                                  RSizedBox(height: 16),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Vehicles Brand',
                                        hintText: 'Enter vehicles brand name'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      RSizedBox(height: 16),

                      //Download Rent Agreement
                      Text(
                        'Download PDF',
                        style: AcnooTextStyle.kBodyMd
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      RSizedBox(height: 16),
                      InkWell(
                        onTap: () => print('download agreement'),
                        child: Container(
                          padding: REdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
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
                              Row(
                                children: [
                                  Container(
                                    height: 35.h,
                                    width: 35.h,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                'assets/images/acnoo_assets/custom_icons/pdf.png'))),
                                  ),
                                  RSizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Rent Agreement',
                                          style: AcnooTextStyle.kBodySm),
                                      RSizedBox(height: 4),
                                      Text(
                                        'https://www.maan.com/pdf/222',
                                        style: AcnooTextStyle.kCaption.copyWith(
                                            color: AcnooAppColors
                                                .kNeutralColor500),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: 38.h,
                                width: 38.h,
                                padding: REdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AcnooAppColors.kPrimaryColor700
                                      .withOpacity(0.15),
                                ),
                                child: Icon(
                                  FeatherIcons.download,
                                  size: 18.sp,
                                  color: AcnooAppColors.kPrimaryColor700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      RSizedBox(height: 24),
                      //Note
                      Text.rich(
                        TextSpan(
                          text: 'Note:  ',
                          style: AcnooTextStyle.kBodySm,
                          children: [
                            TextSpan(
                              text:
                                  'Please complete the pdf and upload the pdf here👇',
                              style: AcnooTextStyle.kBodySm
                                  .copyWith(color: Color(0xff617896)),
                            )
                          ],
                        ),
                      ),
                      RSizedBox(height: 24),

                      //Upload pdf
                      Text(
                        'Upload PDF',
                        style: AcnooTextStyle.kBodyMd
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      RSizedBox(height: 16),
                      Container(
                        padding: REdgeInsets.symmetric(
                            horizontal: 145, vertical: 16),
                        decoration: BoxDecoration(
                          color: AcnooAppColors.kWhite,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          height: 38.h,
                          width: 38.h,
                          padding: REdgeInsets.all(10),
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
                        ),
                      )
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
            width: 135,
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

  Widget applyDonePopup() {
    return AlertDialog(
      insetPadding: REdgeInsets.all(24),
      actionsPadding: REdgeInsets.all(24),
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120.h,
            width: 135.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/images/acnoo_assets/custom_icons/thankyou_check.png'),
              ),
            ),
          ),
          RSizedBox(height: 16),
          Text(
            'Thank You!',
            style: AcnooTextStyle.kHeading2,
          ),
          RSizedBox(height: 8),
          Text(
            'We will review the Application approve it within 24 hours.',
            textAlign: TextAlign.center,
            style: AcnooTextStyle.kBodyMd
                .copyWith(color: AcnooAppColors.kNeutralColor600),
          )
        ],
      ),
      actions: [
        RSizedBox(
          height: 44.h,
          width: 180.w,
          child: TextButton(
            onPressed: () => Get.offAllNamed('/home'),
            style: AcnooButtonStyle.kPrimaryTextButton,
            child: Text('Back to Home'),
          ),
        ),
      ],
    );
  }
}
