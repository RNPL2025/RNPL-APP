import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/data/property/property.dart';

import '../../../widgets/common_widgets.dart';
import '../../../widgets/constants.dart';
import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: false,
      ),
      body: AcnooScaffoldContainer(
        topBar: TabBar(
          unselectedLabelColor: AcnooAppColors.kNeutralColor500,
          labelColor: AcnooAppColors.kPrimaryColor700,
          indicatorColor: AcnooAppColors.kPrimaryColor700,
          controller: controller.tabController,
          tabs: [
            Tab(child: Text('All')),
            Tab(child: Text('Buy')),
            Tab(child: Text('Rent')),
          ],
        ),
        child: TabBarView(
          controller: controller.tabController,
          children: [
            AllTab(),
            Center(
              child: Text('No Data'),
            ),
            Center(
              child: Text('No Data'),
            ),
          ],
        ),
      ),
    );
  }
}

class AllTab extends GetView<FavoritesController> {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.favList.isEmpty
          ? Center(
              child: Text('No Property Added'),
            )
          : ListView.builder(
              itemCount: controller.favList.length,
              itemBuilder: (context, index) => Padding(
                padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: AcnooPropertyCard(
                    ontap: () => Get.toNamed('/property-details',
                        arguments: {'property': controller.favList[index]}),
                    favBtn: InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (popupContext) =>
                            removalPopup(controller.favList[index]),
                      ),
                      child: Container(
                        height: 20.h,
                        width: 20.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AcnooAppColors.kNeutralColor200,
                            shape: BoxShape.circle),
                        child: Icon(
                          controller.favList.contains(controller.favList[index])
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 14.sp,
                          color: AcnooAppColors.kPrimaryColor700,
                        ),
                      ),
                    ),
                    propertyImage: controller.favList[index].imageUrl,
                    rentPerMonth: controller.favList[index].price,
                    title: controller.favList[index].title,
                    address: controller.favList[index].address,
                    bedRooms: controller.favList[index].bedRooms,
                    bathRooms: controller.favList[index].bathRooms,
                    flatArea: controller.favList[index].flatArea,
                    landlordName: controller.favList[index].ownerName),
              ),
            ),
    );
  }

  Widget removalPopup(AcnooPropertyModel property) {
    return AlertDialog(
      insetPadding: REdgeInsets.all(24),
      actionsPadding: REdgeInsets.all(24),
      contentPadding: REdgeInsets.fromLTRB(47, 24, 47, 0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 140.h,
            width: 220.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: AssetImage(property.imageUrl), fit: BoxFit.cover)),
          ),
          RSizedBox(height: 16),
          Text('Are Your Sure!', style: AcnooTextStyle.kHeading2),
          RSizedBox(height: 8),
          Text(
            'Remove ${property.title}',
            textAlign: TextAlign.center,
            style: AcnooTextStyle.kBodyMd
                .copyWith(color: AcnooAppColors.kNeutralColor500),
          )
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Get.close(1),
                style: AcnooButtonStyle.kSecondaryButton.copyWith(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        side: BorderSide(color: AcnooAppColors.kDangerMain),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    foregroundColor: MaterialStatePropertyAll(
                        AcnooAppColors.kSecondaryColor500)),
                child: Text('Cancel'),
              ),
            ),
            RSizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () {
                  controller.favList.remove(property);
                  Get.close(1);
                },
                style: AcnooButtonStyle.kPrimaryTextButton,
                child: Text('Yes'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
