import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';

class AcnooPaymentStatusView extends StatelessWidget {
  const AcnooPaymentStatusView({Key? key, required this.status})
      : super(key: key);
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      bottomNavigationBar: Container(
        color: AcnooAppColors.kWhite,
        padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: TextButton(
          onPressed: () {
            if (status) {
              Get.offAllNamed('/home');
            } else {
              Get.back();
            }
          },
          style: AcnooButtonStyle.kPrimaryTextButton,
          child: Text(status ? 'Back to Home' : 'Try again'),
        ),
      ),
      body: AcnooScaffoldContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 162.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(status
                        ? 'assets/images/acnoo_assets/custom_icons/success.png'
                        : 'assets/images/acnoo_assets/custom_icons/failed.png'),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.fromLTRB(30, 32, 30, 0),
                child: Column(
                  children: [
                    Text(
                      status ? 'Thank You!' : 'oops! Payment Failed',
                      style: AcnooTextStyle.kHeading2,
                    ),
                    RSizedBox(height: 16),
                    Text(
                      status
                          ? 'Your Payment request has been successful.'
                          : 'Your transaction has failed due to some technical error.',
                      textAlign: TextAlign.center,
                      style: AcnooTextStyle.kBodyMd
                          .copyWith(color: AcnooAppColors.kNeutralColor600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
