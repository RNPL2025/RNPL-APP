import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';

import '../controllers/terms_conditions_controller.dart';

class TermsConditionsView extends GetView<TermsConditionsController> {
  const TermsConditionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms & Conditions'), centerTitle: false),
      body: AcnooScaffoldContainer(
        child: ListView(
          padding: REdgeInsets.fromLTRB(24, 24, 20, 18),
          children: [
            buildReadingSection(title: 'Collection of Information'),
            RSizedBox(height: 20),
            buildReadingSection(
                title: 'Distribution of Information',
                description:
                    'Elit pellentesque sapien malesuada eleifend iaculis male suada. Mauris, ut id hendrerit habitant gravida urna con gue arcu sit. At quisque leo semper urna gravida iac ulis nibh aliquam. Morbi tempor facilisi ultricies magna vitae sit. Velit augue sagittis, tempor, \n\nElit pellentesque sapien malesuada eleifend iaculis male suada. Mauris, ut id hendrerit habitant gravida urna con gue arcu sit. At quisque leo semper\n\n Ullamcorper eros senectus urna sit elementum aliquet. Nibh mauris trist ique elit pellentesque sapien malesuada eleifend iaculis malesuada. Mauris, ut id hendrerit habitant gravida urna congue arcu sit. '),
            RSizedBox(height: 20),
            buildReadingSection(
                title: 'Tracking Technology',
                description:
                    'Elit pellentesque sapien malesuada eleifend iaculis male suada. Mauris, ut id hendrerit habitant gravida urna con gue arcu sit. At quisque leo semper urna gravida iac ulis nibh aliquam. Morbi tempor facilisi ultricies magna vitae sit. Velit augue sagittis, tempor, '),
          ],
        ),
      ),
    );
  }

  Widget buildReadingSection({required String title, String? description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AcnooTextStyle.kBodyMd.copyWith(fontWeight: FontWeight.w600),
        ),
        RSizedBox(height: 8),
        Text(
          description ??
              'Ullamcorper eros senectus urna sit elementum aliquet. Nibh mauris trist ique elit pellentesque sapien malesua da eleifend iaculis malesuada. Mauris, ut id hendrerit habitant gravida urna congue arcu sit. At quisque leo semper urna gravida iac ulis nibh aliquam. ',
          style: AcnooTextStyle.kBodySm
              .copyWith(color: AcnooAppColors.kNeutralColor600, height: 1.55),
        )
      ],
    );
  }
}
