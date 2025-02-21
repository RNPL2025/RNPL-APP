import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:rentpro/app/widgets/constants.dart';

import '../controllers/news_article_list_controller.dart';

class NewsArticleListView extends GetView<NewsArticleListController> {
  const NewsArticleListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News & Articles'),
        actions: [
          IconButton(
            onPressed: () {},
            color: AcnooAppColors.kPrimaryColor700,
            icon: Icon(IconlyLight.search),
          )
        ],
      ),
      body: GridView.builder(
        padding: REdgeInsets.symmetric(horizontal: 24, vertical: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 156 / 166,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: 8,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Get.toNamed('/news-article-details', arguments: {
            'title': 'How to sell your home fast in 12 easy steps',
            'image': controller.demoImage[index],
          }),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AcnooAppColors.kWhite,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                Container(
                  height: 96.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(controller.demoImage[index]),
                    ),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '30 Jun 2023    ●   4 min read',
                        style: AcnooTextStyle.kCaption.copyWith(
                            fontSize: 10.sp,
                            color: AcnooAppColors.kNeutralColor500),
                      ),
                      RSizedBox(height: 6),
                      Text(
                        'How to sell your home fast in 12 easy steps',
                        style: AcnooTextStyle.kCaption,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
