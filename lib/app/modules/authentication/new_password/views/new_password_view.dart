import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../widgets/common_widgets.dart';
import '../../../../widgets/constants.dart';
import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Password')),
      body: AcnooScaffoldContainer(
        child: ListView(
          padding: REdgeInsets.fromLTRB(24, 30, 24, 12),
          children: [
            Column(
              children: [
                Text('Set Up New Password', style: AcnooTextStyle.kHeading2),
                RSizedBox(height: 8),
                RSizedBox(
                  width: 287,
                  child: Text(
                      'Reset your password to recovery and log in your account',
                      textAlign: TextAlign.center,
                      style: AcnooTextStyle.kBodyMd
                          .copyWith(color: AcnooAppColors.kNeutralColor600)),
                ),
              ],
            ),
            RSizedBox(height: 8 * 4),
            Obx(() => TextFormField(
                  obscureText: controller.obscureText.value,
                  decoration: InputDecoration(
                      labelText: 'New Password',
                      hintText: '* * * * * * * *',
                      suffixIcon: InkResponse(
                        onTap: () => controller.obscureText.value =
                            !controller.obscureText.value,
                        child: Icon(controller.obscureText.value
                            ? IconlyBold.hide
                            : IconlyBold.show),
                      )),
                )),
            RSizedBox(height: 8 * 2),
            Obx(() => TextFormField(
                  obscureText: controller.obscureText.value,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: '* * * * * * * *',
                      suffixIcon: InkResponse(
                        onTap: () => controller.obscureText.value =
                            !controller.obscureText.value,
                        child: Icon(controller.obscureText.value
                            ? IconlyBold.hide
                            : IconlyBold.show),
                      )),
                )),
            RSizedBox(height: 8 * 4),
            TextButton(
                onPressed: () {},
                style: AcnooButtonStyle.kPrimaryTextButton,
                child: Text('Continue'))
          ],
        ),
      ),
    );
  }
}
