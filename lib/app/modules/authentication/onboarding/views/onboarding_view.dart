import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/modules/authentication/onboarding/data/onboard_data.dart';
import 'package:rentpro/app/widgets/constants.dart';
import 'package:rentpro/app/widgets/shapes.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: REdgeInsets.fromLTRB(0, 12, 0, 12),
            child: TextButton(
              onPressed: () => Get.toNamed('/welcome'),
              child: Text(
                "Skip",
                style: AcnooTextStyle.kBodySm.copyWith(
                    fontSize: 13.sp, color: AcnooAppColors.kNeutralColor500),
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Center(
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) => controller.currentIndex.value = value,
          controller: controller.imageController,
          itemCount: AcnooOnboardItems.onboardItems.length,
          itemBuilder: (context, index) => Container(
            color: AcnooCommonUtils.containerColors[index],
            padding: REdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 340.h,
              margin: REdgeInsets.only(bottom: 200),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          AcnooOnboardItems.onboardItems[index].imageUrl))),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipPath(
        clipper: OnboardShapeClipper(),
        child: Container(
          height: 320.h,
          width: Get.width,
          color: AcnooAppColors.kWhite,
          child: Column(
            children: [
              Flexible(
                child: PageView.builder(
                  onPageChanged: (value) =>
                      controller.currentIndex.value = value,
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.textController,
                  itemCount: AcnooOnboardItems.onboardItems.length,
                  itemBuilder: (context, index) => Padding(
                    padding: REdgeInsets.fromLTRB(25, 32, 25, 0),
                    child: Column(
                      children: [
                        Text(
                          AcnooOnboardItems.onboardItems[index].title,
                          style: AcnooTextStyle.kHeading2,
                        ),
                        RSizedBox(height: 16),
                        Text(
                          AcnooOnboardItems.onboardItems[index].description,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.symmetric(vertical: 48),
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          AcnooOnboardItems.onboardItems.length,
                          (index) => Padding(
                                padding: REdgeInsets.only(right: 8),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: controller.currentIndex.value == index
                                      ? 20.w
                                      : 6.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.r),
                                    border: Border.all(
                                        color: AcnooAppColors.kPrimaryColor700),
                                    color:
                                        controller.currentIndex.value == index
                                            ? AcnooAppColors.kPrimaryColor700
                                            : Colors.transparent,
                                  ),
                                ),
                              )),
                    )),
              ),
              Padding(
                padding: REdgeInsets.fromLTRB(24, 0, 24, 16),
                child: TextButton(
                    onPressed: () => controller.handleNextButton(),
                    style: AcnooButtonStyle.kPrimaryTextButton,
                    child: Text("Next")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
