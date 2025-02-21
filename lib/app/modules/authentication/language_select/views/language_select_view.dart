import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentpro/app/widgets/constants.dart';

import '../../../../widgets/common_widgets.dart';
import '../controllers/language_select_controller.dart';

class LanguageSelectView extends GetView<LanguageSelectController> {
  const LanguageSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Language')),
      bottomNavigationBar: Container(
        padding: REdgeInsets.fromLTRB(24, 8, 24, 16),
        color: AcnooAppColors.kWhite,
        child: TextButton(
            onPressed: () => controller.handleNextButton(),
            style: AcnooButtonStyle.kPrimaryTextButton,
            child: Text('Next')),
      ),
      body: AcnooScaffoldContainer(
        child: ListView.builder(
          padding: REdgeInsets.fromLTRB(24, 24, 24, 12),
          itemCount: controller.supportedLanguage.length,
          itemBuilder: (context, index) => Padding(
            padding: REdgeInsets.only(bottom: 16),
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: AcnooAppColors.kWhite,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: AcnooAppColors.kNeutralColor200,
                      blurRadius: 1.5,
                      spreadRadius: 0.5,
                    )
                  ],
                ),
                child: RadioListTile<AcnooLanguageModel>(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: controller.supportedLanguage[index],
                    title: Row(
                      children: [
                        Flag.fromString(
                          controller.supportedLanguage[index].countryCode,
                          height: 28.h,
                          width: 46.w,
                          borderRadius: 2,
                          fit: BoxFit.cover,
                        ),
                        RSizedBox(width: 16),
                        Text(
                          controller.supportedLanguage[index].languageName,
                          style: AcnooTextStyle.kBodyMd,
                        ),
                      ],
                    ),
                    groupValue: controller.selectedLanguage.value,
                    onChanged: (value) {
                      controller.selectedLanguage.value = value!;
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
