import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/widgets/constants.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AcnooAppColors.kPrimaryColor700,
      body: Center(
        child: CircleAvatar(
          radius: 100.r,
          backgroundColor: AcnooAppColors.kWhite,
          child: Container(
            height: 100.h,
            width: 133.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/acnoo_assets/rentpro_logo.png'))),
          ),
        ),
      ),
    );
  }
}
