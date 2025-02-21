import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../widgets/constants.dart';

class AcnooCopyContactSheet extends StatelessWidget {
  const AcnooCopyContactSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.fromLTRB(24, 8, 24, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Container(
                height: 3.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: AcnooAppColors.kNeutralColor300,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              RSizedBox(height: 10),
              Text(
                'View Mobile Number',
                style: AcnooTextStyle.kBodyMd
                    .copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
          RSizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(IconlyBold.call,
                  size: 18.sp, color: AcnooAppColors.kNeutralColor600),
              RSizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Landlord Mobile Number', style: AcnooTextStyle.kBodySm),
                  RSizedBox(height: 4),
                  Text('0185567156'),
                ],
              )
            ],
          ),
          RSizedBox(height: 28),
          TextButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(text: '0185567156'),
              );
              Get.close(1);
              AcnooCommonUtils.showScaffoldToast(
                  context: context, message: '0185567156 Copied');
            },
            style: AcnooButtonStyle.kSecondaryButton,
            child: Text('Copy'),
          )
        ],
      ),
    );
  }
}
