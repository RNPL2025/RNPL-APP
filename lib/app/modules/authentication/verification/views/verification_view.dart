import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import 'package:get/get.dart';

import '../../../../widgets/common_widgets.dart';
import '../../../../widgets/constants.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification')),
      body: AcnooScaffoldContainer(
        child: ListView(
          padding: REdgeInsets.fromLTRB(24, 30, 24, 12),
          children: [
            Column(
              children: [
                Text('Verification', style: AcnooTextStyle.kHeading2),
                RSizedBox(height: 8),
                RSizedBox(
                  width: 287,
                  child: Text(
                      'We’ve the code send to your email address - random@gmail.com',
                      textAlign: TextAlign.center,
                      style: AcnooTextStyle.kBodyMd
                          .copyWith(color: AcnooAppColors.kNeutralColor600)),
                ),
              ],
            ),
            RSizedBox(height: 8 * 4),
            Pinput(
              length: 6,
              focusedPinTheme: PinTheme(
                  height: 50.h,
                  width: 46.w,
                  decoration: BoxDecoration(
                      color: AcnooAppColors.kWhite,
                      border:
                          Border.all(color: AcnooAppColors.kPrimaryColor700),
                      borderRadius: BorderRadius.circular(10))),
              defaultPinTheme: PinTheme(
                  height: 50.h,
                  width: 46.w,
                  decoration: BoxDecoration(
                      color: AcnooAppColors.kWhite,
                      border:
                          Border.all(color: AcnooAppColors.kNeutralColor300),
                      borderRadius: BorderRadius.circular(10))),
            ),
            RSizedBox(height: 8 * 3),
            Center(
              child: Obx(() => Text(
                    controller.countdownSeconds.value >= 60
                        ? "01:00"
                        : (controller.countdownSeconds.value <= 0
                            ? "00:00"
                            : "00:${controller.countdownSeconds.value}"),
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.bold),
                  )),
            ),
            RSizedBox(height: 8),
            Text.rich(
              TextSpan(
                  text: 'Didn’t receive code? ',
                  style: AcnooTextStyle.kBodySm
                      .copyWith(color: AcnooAppColors.kNeutralColor600),
                  children: [
                    TextSpan(
                        text: 'Resend Code',
                        style: AcnooTextStyle.kBodySm.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AcnooAppColors.kPrimaryColor700),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => controller.startTimer())
                  ]),
              textAlign: TextAlign.center,
            ),
            RSizedBox(height: 8 * 4),
            TextButton(
                onPressed: () => Get.toNamed('/new-password'),
                style: AcnooButtonStyle.kPrimaryTextButton,
                child: Text('Continue'))
          ],
        ),
      ),
    );
  }
}
