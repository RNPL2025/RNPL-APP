import 'package:get/get.dart';

import '../controllers/news_article_details_controller.dart';

class NewsArticleDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsArticleDetailsController>(
      () => NewsArticleDetailsController(),
    );
  }
}
