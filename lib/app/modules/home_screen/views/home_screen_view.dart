import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:unicons/unicons.dart';

import '../../../data/property/property.dart';
import '../../../widgets/constants.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AcnooAppColors.kPrimaryColor700,
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: 75, maxHeight: 88),
            padding: REdgeInsets.fromLTRB(24, 8, 24, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    AssetImage("assets/images/acnoo_assets/home_container.png"),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi there! searching in',
                      style: AcnooTextStyle.kBodySm
                          .copyWith(color: AcnooAppColors.kNeutralColor100),
                    ),
                    DropdownButtonHideUnderline(
                      child: Obx(
                        () => DropdownButton2(
                          iconStyleData: IconStyleData(
                              icon: Icon(
                            UniconsLine.angle_down,
                            color: AcnooAppColors.kWhite,
                          )),
                          buttonStyleData:
                              ButtonStyleData(width: (50 + 82 + 24)),
                          selectedItemBuilder: (context) => controller.cityList
                              .map(
                                (data) => DropdownMenuItem(
                                  child: Text(
                                    data,
                                    style: AcnooTextStyle.kBodyLg.copyWith(
                                        color: AcnooAppColors.kWhite,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                              .toList(),
                          dropdownStyleData: DropdownStyleData(
                              maxHeight: 300,
                              padding: REdgeInsets.symmetric(horizontal: 12)),
                          value: controller.selectedCity.value,
                          items: List.generate(
                            controller.cityList.length,
                            (index) => DropdownMenuItem(
                              child: Text(
                                controller.cityList[index],
                                style: AcnooTextStyle.kBodyMd.copyWith(
                                    color: AcnooAppColors.kNeutralColor900),
                              ),
                              value: controller.cityList[index],
                            ),
                          ),
                          onChanged: (value) {
                            controller.selectedCity.value = value!;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   height: 40.h,
                //   width: 125.w,
                //   padding: REdgeInsets.symmetric(horizontal: 12, vertical: 6),
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(6),
                //       color: AcnooAppColors.kWhite.withOpacity(0.15)),
                //   child: Text(
                //     '+ Post Property',
                //     style: AcnooTextStyle.kBodySm.copyWith(
                //         fontWeight: FontWeight.bold,
                //         color: AcnooAppColors.kWhite),
                //   ),
                // )
              ],
            ),
          ),
          Expanded(
            child: AcnooScaffoldContainer(
              topBar: Column(
                children: [
                  // TabBar(
                  //   controller: controller.tabController,
                  //   labelColor: AcnooAppColors.kPrimaryColor700,
                  //   unselectedLabelColor: AcnooAppColors.kNeutralColor500,
                  //   indicator: BoxDecoration(
                  //       color:
                  //           AcnooAppColors.kPrimaryColor700.withOpacity(0.05),
                  //       border: Border(
                  //           bottom: BorderSide(
                  //               color: AcnooAppColors.kPrimaryColor700,
                  //               width: 1.5.w))),
                  //   tabs: [
                  //     Tab(
                  //       child: Text(
                  //         'Buy',
                  //         style: AcnooTextStyle.kBodyMd
                  //             .copyWith(fontWeight: FontWeight.w600),
                  //       ),
                  //     ),
                  //     Tab(
                  //       child: Text(
                  //         'Rent',
                  //         style: AcnooTextStyle.kBodyMd
                  //             .copyWith(fontWeight: FontWeight.w600),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: REdgeInsets.fromLTRB(24, 16, 24, 12),
                    child: Obx(() => AnimatedSearchField(
                          onTap: () => Get.toNamed('/acnoo-search', arguments: {
                            "q": controller.selectedTab == 0 ? 'Buy' : 'Rent',
                            "selectedCity": controller.selectedCity,
                          }),
                          animatedTextList: [
                            "Apartment",
                            "House",
                            "Land",
                            "Room",
                            "Commercial Property",
                            "Studio",
                            "Duplex",
                          ],
                          hintText: controller.selectedTab == 0
                              ? 'Search buy for'
                              : 'Search rent for',
                        )),
                  ),
                ],
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Color(0xffF2F3F8),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: ShapeChild(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShapeChild extends GetView<HomeScreenController> {
  const ShapeChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          child: Column(
            children: [
              //---------Recent Search----------//
              Container(
                decoration: BoxDecoration(
                  color: AcnooAppColors.kWhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 52.h,
                        width: 54.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/acnoo_assets/home_glow_line.png'),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Text(
                            'Recent Searches',
                            style: AcnooTextStyle.kBodyMd
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                2,
                                (index) => Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 16 : 0, right: 12),
                                  child: Container(
                                    width: 164.w,
                                    padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                                    decoration: BoxDecoration(
                                      color: AcnooAppColors.kWhite,
                                      border: Border.all(
                                          color:
                                              AcnooAppColors.kNeutralColor200),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(
                                                  IconlyLight.search,
                                                  size: 16.sp,
                                                  color: AcnooAppColors
                                                      .kPrimaryColor700,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '  Search for rent',
                                                style: AcnooTextStyle.kBodySm
                                                    .copyWith(
                                                  color: AcnooAppColors
                                                      .kPrimaryColor700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RSizedBox(height: 8),
                                        Text(
                                          'Rent, Delhi, India, any price, any area.',
                                          style: AcnooTextStyle.kCaption
                                              .copyWith(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              RSizedBox(height: 16),

              //---------Recommended Properties--------//
              Container(
                padding: REdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AcnooAppColors.kWhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: REdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommended Properties',
                            style: AcnooTextStyle.kBodyMd
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'View All',
                            style: AcnooTextStyle.kCaption.copyWith(
                                color: AcnooAppColors.kNeutralColor500),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            children: List.generate(2, (index) {
                              final property =
                                  AcnooDemoProperties.properties[index];
                              return Padding(
                                padding: REdgeInsets.only(
                                    left: index == 0 ? 16 : 0, right: 16),
                                child: AcnooPropertyCard(
                                  ontap: () => Get.toNamed('/property-details',
                                      arguments: {
                                        'property': property,
                                      }),
                                  favBtn: InkWell(
                                    onTap: () =>
                                        controller.addToFavList(property),
                                    child: Container(
                                      height: 20.h,
                                      width: 20.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color:
                                              AcnooAppColors.kNeutralColor200,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        controller.favController.favList
                                                .contains(property)
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        size: 14.sp,
                                        color: AcnooAppColors.kPrimaryColor700,
                                      ),
                                    ),
                                  ),
                                  address: AcnooDemoProperties
                                      .properties[index].address,
                                  bathRooms: AcnooDemoProperties
                                      .properties[index].bathRooms,
                                  bedRooms: AcnooDemoProperties
                                      .properties[index].bedRooms,
                                  flatArea: AcnooDemoProperties
                                      .properties[index].flatArea,
                                  rentPerMonth: AcnooDemoProperties
                                      .properties[index].price,
                                  title: AcnooDemoProperties
                                      .properties[index].title,
                                  propertyImage: AcnooDemoProperties
                                      .properties[index].imageUrl,
                                  landlordName: AcnooDemoProperties
                                      .properties[index].ownerName,
                                ),
                              );
                            }),
                          ),
                          RSizedBox(height: 10),
                          Row(
                            children: List.generate(
                              2,
                              (index) {
                                final property =
                                    AcnooDemoProperties.properties[index + 2];
                                return Padding(
                                  padding: REdgeInsets.only(
                                      left: index == 0 ? 16 : 0, right: 16),
                                  child: AcnooPropertyCard(
                                    ontap: () => Get.toNamed(
                                        '/property-details',
                                        arguments: {
                                          'property': property,
                                        }),
                                    favBtn: InkWell(
                                      onTap: () {
                                        if (controller.favController.favList
                                            .contains(property)) {
                                          controller.favController.favList
                                              .remove(property);
                                          print('Already Added');
                                        } else {
                                          controller.favController.favList
                                              .add(property);
                                          print("addded");
                                        }
                                        controller.update();
                                        controller.favController.update();
                                      },
                                      child: Container(
                                        height: 20.h,
                                        width: 20.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                AcnooAppColors.kNeutralColor200,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          controller.favController.favList
                                                  .contains(property)
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          size: 14.sp,
                                          color:
                                              AcnooAppColors.kPrimaryColor700,
                                        ),
                                      ),
                                    ),
                                    address: AcnooDemoProperties
                                        .properties[index + 2].address,
                                    bathRooms: AcnooDemoProperties
                                        .properties[index + 2].bathRooms,
                                    bedRooms: AcnooDemoProperties
                                        .properties[index + 2].bedRooms,
                                    flatArea: AcnooDemoProperties
                                        .properties[index + 2].flatArea,
                                    rentPerMonth: AcnooDemoProperties
                                        .properties[index + 2].price,
                                    title: AcnooDemoProperties
                                        .properties[index + 2].title,
                                    propertyImage: AcnooDemoProperties
                                        .properties[index + 2].imageUrl,
                                    landlordName: AcnooDemoProperties
                                        .properties[index + 2].ownerName,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              RSizedBox(height: 16),

              //---------Post Property Banner--------//
              Container(
                height: 136.h,
                width: 327.w,
                padding: REdgeInsets.only(bottom: 18, left: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: AcnooAppColors.kNeutralColor200),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/demo_images/demo_banner01.png'),
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
              RSizedBox(height: 16),

              //---------Properties For Buy--------//
              Container(
                padding: REdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AcnooAppColors.kWhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: REdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Properties For Buy',
                            style: AcnooTextStyle.kBodyMd
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'View All',
                            style: AcnooTextStyle.kCaption.copyWith(
                                color: AcnooAppColors.kNeutralColor500),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          AcnooDemoProperties.properties.length,
                          (index) {
                            final property =
                                AcnooDemoProperties.properties[index];
                            return Padding(
                              padding: REdgeInsets.only(
                                  left: index == 0 ? 16 : 0, right: 16),
                              child: AcnooPropertyCardV2(
                                ontap: () => Get.toNamed('/property-details',
                                    arguments: {
                                      'property': property,
                                    }),
                                favBtn: InkWell(
                                  onTap: () =>
                                      controller.addToFavList(property),
                                  child: Container(
                                    height: 20.h,
                                    width: 20.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AcnooAppColors.kNeutralColor200,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      controller.favController.favList
                                              .contains(property)
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      size: 14.sp,
                                      color: AcnooAppColors.kPrimaryColor700,
                                    ),
                                  ),
                                ),
                                address: property.address,
                                bathRooms: property.bathRooms,
                                bedRooms: property.bedRooms,
                                flatArea: property.flatArea,
                                propertyPrice: property.price,
                                title: property.title,
                                propertyImage: property.imageUrl,
                                landlordName: property.ownerName,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RSizedBox(height: 16),

              //---------Properties For Rent--------//
              Container(
                padding: REdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AcnooAppColors.kWhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: REdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Properties For Rent',
                            style: AcnooTextStyle.kBodyMd
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'View All',
                            style: AcnooTextStyle.kCaption.copyWith(
                                color: AcnooAppColors.kNeutralColor500),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          AcnooDemoProperties.properties.length,
                          (index) {
                            final property =
                                AcnooDemoProperties.properties[index];
                            return Padding(
                              padding: REdgeInsets.only(
                                  left: index == 0 ? 16 : 0, right: 16),
                              child: AcnooPropertyCardV2(
                                ontap: () => Get.toNamed('/property-details',
                                    arguments: {
                                      'property': property,
                                    }),
                                favBtn: InkWell(
                                  onTap: () =>
                                      controller.addToFavList(property),
                                  child: Container(
                                    height: 20.h,
                                    width: 20.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AcnooAppColors.kNeutralColor200,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      controller.favController.favList
                                              .contains(property)
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      size: 14.sp,
                                      color: AcnooAppColors.kPrimaryColor700,
                                    ),
                                  ),
                                ),
                                address: property.address,
                                bathRooms: property.bathRooms,
                                bedRooms: property.bedRooms,
                                flatArea: property.flatArea,
                                propertyPrice: property.price,
                                title: property.title,
                                propertyImage: property.imageUrl,
                                landlordName: property.ownerName,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RSizedBox(height: 24),

              //---------News & Articles--------//
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News & Articles',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed('/news-article-list'),
                    child: Text(
                      'View All',
                      style: AcnooTextStyle.kCaption
                          .copyWith(color: AcnooAppColors.kNeutralColor500),
                    ),
                  )
                ],
              ),
              RSizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: REdgeInsets.only(
                          right: index == 4 ? 0 : 16, bottom: 12),
                      child: InkWell(
                        onTap: () =>
                            Get.toNamed('/news-article-details', arguments: {
                          'title':
                              'How to sell your home fast in 12 easy steps',
                          'image': 'assets/images/demo_images/demo_news01.png',
                        }),
                        child: Container(
                          width: 211.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: AcnooAppColors.kWhite,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 116.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/demo_images/demo_news01.png'),
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
                                          color:
                                              AcnooAppColors.kNeutralColor500),
                                    ),
                                    RSizedBox(height: 6),
                                    Text(
                                      'How to sell your home fast in 12 easy steps',
                                      style: AcnooTextStyle.kCaption.copyWith(
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSearchField extends StatefulWidget {
  const AnimatedSearchField({
    Key? key,
    required this.hintText,
    required this.animatedTextList,
    this.onTap,
  }) : super(key: key);

  final String hintText;
  final List<String> animatedTextList;
  final VoidCallback? onTap;

  @override
  _AnimatedSearchFieldState createState() => _AnimatedSearchFieldState();
}

class _AnimatedSearchFieldState extends State<AnimatedSearchField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  int _textIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(Duration(seconds: 1), () {
          _controller.reverse(from: 1.0);
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _textIndex = (_textIndex + 1) % widget.animatedTextList.length;
          _animation = IntTween(
            begin: 0,
            end: widget.animatedTextList[_textIndex].length,
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ));
        });
        _controller.forward(from: 0);
      }
    });

    _animation = IntTween(
      begin: 0,
      end: widget.animatedTextList[_textIndex].length,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final length = _animation.value;
        final hintText =
            widget.animatedTextList[_textIndex].substring(0, length);

        return InkWell(
          onTap: widget.onTap,
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
                hintText: '${widget.hintText} $hintText',
                filled: true,
                fillColor: AcnooAppColors.kWhite,
                prefixIcon: Icon(IconlyLight.search),
                suffixIcon: Padding(
                  padding: REdgeInsets.all(4.0),
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AcnooAppColors.kPrimaryColor700,
                        borderRadius: BorderRadius.circular(6)),
                    child: Icon(MdiIcons.tuneVariant,
                        color: AcnooAppColors.kWhite, size: 20.sp),
                  ),
                )),
          ),
        );
      },
    );
  }
}
