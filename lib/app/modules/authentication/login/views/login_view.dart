import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../widgets/constants.dart';
import '../../../../widgets/shapes.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode passwordFieldFocus = FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Log In')),
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
                    'Welcome Back',
                    style: AcnooTextStyle.kHeading2,
                  ),
                  RSizedBox(height: 8),
                  Text(
                    'Use your credentials below and login to your account.',
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
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter your email',
                              ),
                              onFieldSubmitted: (value) =>
                                  FocusScope.of(context)
                                      .requestFocus(passwordFieldFocus)),
                          RSizedBox(height: 16),
                          Obx(() => TextFormField(
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
                          RSizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(
                                    () => RSizedBox(
                                      height: 16,
                                      width: 16,
                                      child: Checkbox(
                                        value: controller.rememberMe.value,
                                        onChanged: (value) => controller
                                            .rememberMe.value = value!,
                                      ),
                                    ),
                                  ),
                                  RSizedBox(width: 8),
                                  Text(
                                    'Remember me',
                                    style: AcnooTextStyle.kBodySm.copyWith(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () => Get.toNamed('/forgot-password'),
                                child: Text('Forgot password',
                                    style: AcnooTextStyle.kBodySm.copyWith(
                                        fontSize: 13.sp,
                                        color: AcnooAppColors.kNeutralColor600,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                          RSizedBox(height: 24),
                          TextButton(
                              onPressed: () => controller
                                  .handleLogin(controller.args['user']),
                              style: AcnooButtonStyle.kPrimaryTextButton,
                              child: Text('Sign In'))
                        ],
                      ),
                    ),
                  ),
                  RSizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text: 'Are Your New Here? ',
                      style: AcnooTextStyle.kBodySm
                          .copyWith(color: AcnooAppColors.kNeutralColor600),
                      children: [
                        TextSpan(
                            text: 'Create an account',
                            style: AcnooTextStyle.kBodySm.copyWith(
                                color: AcnooAppColors.kPrimaryColor700,
                                fontWeight: FontWeight.w600),

                            //TODO: Navigate to home screen when home screen is completed
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.offAndToNamed('/signup'))
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
