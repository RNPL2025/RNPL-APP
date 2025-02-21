import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Forgot Password')),
        body: AcnooScaffoldContainer(
            child: ListView(
          padding: REdgeInsets.fromLTRB(24, 30, 24, 12),
          children: [
            Column(
              children: [
                Text('Forgot Password', style: AcnooTextStyle.kHeading2),
                RSizedBox(height: 8),
                RSizedBox(
                  width: 287,
                  child: Text(
                      'Enter your email address and we will send you code',
                      textAlign: TextAlign.center,
                      style: AcnooTextStyle.kBodyMd
                          .copyWith(color: AcnooAppColors.kNeutralColor600)),
                ),
              ],
            ),
            RSizedBox(height: 8 * 4),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Email', hintText: 'Enter email'),
            ),
            RSizedBox(height: 8 * 4),
            TextButton(
                onPressed: () => Get.toNamed('/verification'),
                style: AcnooButtonStyle.kPrimaryTextButton,
                child: Text('Continue'))
          ],
        )));
  }
}
