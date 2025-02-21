import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';

import '../../../../../widgets/constants.dart';
import '../controllers/news_article_details_controller.dart';

class NewsArticleDetailsView extends GetView<NewsArticleDetailsController> {
  const NewsArticleDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News & Articles Details')),
      body: AcnooScaffoldContainer(
        child: ListView(
          padding: REdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            Container(
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(controller.args['image']),
                    fit: BoxFit.cover),
              ),
            ),
            RSizedBox(height: 10),
            Text(
              '30 Jun 2023    ●   4 min read',
              style: AcnooTextStyle.kCaption
                  .copyWith(color: AcnooAppColors.kNeutralColor500),
            ),
            RSizedBox(height: 8),
            Text(controller.args['title'], style: AcnooTextStyle.kHeading3),
            Divider(
              color: AcnooAppColors.kNeutralColor200,
              thickness: 1.5,
            ),
            buildTitleDescriptionSection(
              title: 'Introduction:',
              description:
                  'Selling a home can be a daunting task, but with the right approach and some strategic planning, you can expedite the process. In this blog post, we will guide you through 12 easy steps to help you .',
            ),
            RSizedBox(height: 20),
            buildTitleDescriptionSection(
              title: 'Step 1: Enhance Curb Appeal',
              description:
                  "First impressions matter, so focus on improving your home's exterior. Clean up the yard, trim bushes, and freshen up the paint if needed. A well-maintained exterior creates a positive impression",
            ),
            RSizedBox(height: 20),
            buildTitleDescriptionSection(
              title: 'Step 2: Declutter and Depersonalize',
              description:
                  "Clear out clutter and personal items from your home. Buyers want to envision themselves in the space, so neutralize the décor and create a blank canvas for their imagination.",
            ),
            RSizedBox(height: 20),
            //---------Post Property Banner--------//
            Container(
              height: 136.h,
              width: 327.w,
              padding: REdgeInsets.only(bottom: 18, left: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AcnooAppColors.kNeutralColor200),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/demo_images/demo_banner01.png'),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 36.h,
                  width: 111.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AcnooAppColors.kPrimaryColor700,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Post Property',
                    style: AcnooTextStyle.kBodySm.copyWith(
                        color: AcnooAppColors.kWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            RSizedBox(height: 20),
            buildTitleDescriptionSection(
              title: 'Step 3: Stage Your Home',
              description:
                  "Consider professional home staging to showcase your property's full potential. Staging can help buyers visualize how each room can be used and create an inviting atmosphere.",
            ),
            RSizedBox(height: 20),
            buildTitleDescriptionSection(
              title: 'Step 4: Make Necessary Repairs',
              description:
                  "Fix any visible issues such as leaky faucets, broken tiles, or peeling paint. Addressing these minor repairs shows buyers that your home has been well-maintained.",
            ),
            RSizedBox(height: 20),
            buildTitleDescriptionSection(
              title: 'Step 5: Price it Right',
              description:
                  "Research the market and set a competitive price for your home. Overpricing can deter potential buyers, while pricing it too low may raise suspicions. Consult with a real estate agent to determine the optimal price range.",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitleDescriptionSection(
      {required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AcnooTextStyle.kBodyMd.copyWith(fontWeight: FontWeight.w500),
        ),
        RSizedBox(height: 8),
        Text(
          description,
          style: AcnooTextStyle.kBodySm
              .copyWith(color: Color(0xff4E4E4E), height: 1.65),
        )
      ],
    );
  }
}
