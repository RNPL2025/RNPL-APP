import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../widgets/constants.dart';
import '../../../../widgets/shapes.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final FocusNode emailFieldFocus = FocusNode();
    final FocusNode passwordFieldFocus = FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Sign Up')),
      body: Column(
        children: [
          Obx(() => Visibility(
                visible: !controller.formFocus.value,
                child: Container(
                  height: 52.h,
                  width: 179.w,
                  margin: REdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                              'assets/images/acnoo_assets/rentpro_logo_02.png'))),
                ),
              )),
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
                    'Create an Account',
                    style: AcnooTextStyle.kHeading2,
                  ),
                  RSizedBox(height: 8),
                  Text(
                    'Let’s us know what your name, email, and your password',
                    textAlign: TextAlign.center,
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(color: AcnooAppColors.kNeutralColor600),
                  ),
                  RSizedBox(height: 24),
                  Focus(
                    focusNode: controller.formFocusNode,
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                              controller: controller.nameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                hintText: 'Enter your name',
                              ),
                              onFieldSubmitted: (value) =>
                                  FocusScope.of(context)
                                      .requestFocus(emailFieldFocus)),
                          RSizedBox(height: 16),
                          TextFormField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              focusNode: emailFieldFocus,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter your email',
                              ),
                              onFieldSubmitted: (value) =>
                                  FocusScope.of(context)
                                      .requestFocus(passwordFieldFocus)),
                          RSizedBox(height: 16),
                          Obx(() => TextFormField(
                                controller: controller.passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: controller.obscureText.value,
                                focusNode: passwordFieldFocus,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: '* * * * * * * *',
                                    suffixIcon: InkResponse(
                                      onTap: () =>
                                          controller.obscureText.value =
                                              !controller.obscureText.value,
                                      child: Icon(controller.obscureText.value
                                          ? IconlyBold.hide
                                          : IconlyBold.show),
                                    )),
                              )),
                          RSizedBox(height: 32),
                          TextButton(
                              onPressed: () => controller.signupFunc(),
                              style: AcnooButtonStyle.kPrimaryTextButton,
                              child: Text('Sign Up'))
                        ],
                      ),
                    ),
                  ),
                  RSizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: AcnooTextStyle.kBodySm
                          .copyWith(color: AcnooAppColors.kNeutralColor600),
                      children: [
                        TextSpan(
                            text: 'Sign In',
                            style: AcnooTextStyle.kBodySm.copyWith(
                                color: AcnooAppColors.kPrimaryColor700,
                                fontWeight: FontWeight.w600),

                            //TODO: Navigate to home screen when home screen is completed
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.offAndToNamed('/login'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
