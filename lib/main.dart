import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/widgets/theme/theme_data.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  runApp(const AcnooApp());
}

class AcnooApp extends StatelessWidget {
  const AcnooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        title: "Rent Pro",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: AcnooTheme.lightTheme,
      ),
      designSize: Size(375, 812),
    );
  }
}
