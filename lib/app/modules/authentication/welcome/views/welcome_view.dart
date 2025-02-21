import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../widgets/constants.dart';
import '../../../../widgets/shapes.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Text(
            'Hello there✋',
            style: AcnooTextStyle.kBodyMd,
          ),
          RSizedBox(height: 4),
          Container(
            height: 40.h,
            width: 225.w,
            margin: REdgeInsets.only(bottom: 36),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/acnoo_assets/welcome_to_rentpro.png'),
              ),
            ),
          ),
          Expanded(
              child: ClipPath(
            clipper: WelcomeShapeClipper(),
            child: Container(
              // height: 626.45.h,
              width: Get.width,
              padding: REdgeInsets.fromLTRB(24, 24, 24, 0),
              color: AcnooAppColors.kWhite,
              child: Column(
                children: [
                  Container(
                    height: 65.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/acnoo_assets/home_glow.png'))),
                  ),
                  RSizedBox(height: 24),
                  Text(
                    'What are you looking for?',
                    style: AcnooTextStyle.kHeading2,
                  ),
                  RSizedBox(height: 8),
                  Text(
                    'Start with this search, can be changed later',
                    textAlign: TextAlign.center,
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(color: AcnooAppColors.kNeutralColor600),
                  ),
                  RSizedBox(height: 32),
                  ...List.generate(
                    2,
                    (index) => Padding(
                      padding: REdgeInsets.only(bottom: index == 0 ? 20 : 0),
                      child: InkWell(
                        onTap: () => controller.selectedButton.value = index,
                        child: Obx(
                          () => Container(
                            padding: REdgeInsets.fromLTRB(16, 8, 12, 8),
                            decoration: BoxDecoration(
                              color: AcnooAppColors.kScaffoldBackground,
                              border: controller.selectedButton == index
                                  ? Border.all(
                                      color: AcnooAppColors.kPrimaryColor700,
                                      width: 1.5)
                                  : null,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      index == 0
                                          ? 'Tenant & Customer'
                                          : 'Agent, Owner & Landlord',
                                      style: AcnooTextStyle.kBodySm.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    RSizedBox(height: 4),
                                    Text(
                                      index == 0
                                          ? 'Buy, Rent & Search property'
                                          : 'Sell or Rent you property',
                                      style: AcnooTextStyle.kCaption,
                                    ),
                                  ],
                                ),
                                controller.selectedButton == index
                                    ? Icon(Icons.check_circle,
                                        color: AcnooAppColors.kPrimaryColor700)
                                    : SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RSizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text: 'Continue as ',
                      style: AcnooTextStyle.kBodySm
                          .copyWith(color: AcnooAppColors.kNeutralColor600),
                      children: [
                        TextSpan(
                            text: 'Guest',
                            style: AcnooTextStyle.kBodySm.copyWith(
                                color: AcnooAppColors.kPrimaryColor700,
                                fontWeight: FontWeight.w600),

                            //TODO: Navigate to home screen when home screen is completed
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => controller.handleGuestButton())
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: Container(
        color: AcnooAppColors.kWhite,
        padding: REdgeInsets.fromLTRB(24, 0, 24, 16),
        child: TextButton(
            onPressed: () => controller.nextButton(),
            style: AcnooButtonStyle.kPrimaryTextButton,
            child: Text("Continue")),
      ),
    );
  }
}
