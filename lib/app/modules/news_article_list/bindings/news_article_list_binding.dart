import 'package:get/get.dart';

import '../controllers/news_article_list_controller.dart';

class NewsArticleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsArticleListController>(
      () => NewsArticleListController(),
    );
  }
}
