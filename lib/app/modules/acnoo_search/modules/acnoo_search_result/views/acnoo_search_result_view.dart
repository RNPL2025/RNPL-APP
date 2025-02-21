import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../data/property/property.dart';
import '../../../../../widgets/constants.dart';
import '../controllers/acnoo_search_result_controller.dart';

class AcnooSearchResultView extends GetView<AcnooSearchResultController> {
  const AcnooSearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Apartments', 'House', 'Builder Floor'];

    return Scaffold(
      backgroundColor: Color(0xffF0EDFE),
      appBar: AppBar(
        leadingWidth: 24 + 8 + 8,
        title: Container(
          height: 40.h,
          child: TextFormField(
            controller: controller.searchController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: AcnooAppColors.kWhite,
                prefixIcon: Icon(IconlyLight.search),
                suffixIcon: InkWell(
                  onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
                      context: context,
                      builder: (context) => FilterModalSheet()),
                  child: Container(
                    margin: REdgeInsets.all(4),
                    padding: REdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AcnooAppColors.kNeutralColor300),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(MdiIcons.tuneVariant, size: 12.sp),
                        RSizedBox(width: 8),
                        Text('Filter', style: AcnooTextStyle.kBodySm),
                        RSizedBox(width: 8),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
      body: AcnooScaffoldContainer(
        topBar: TabBar(
          isScrollable: true,
          controller: controller.tabController,
          unselectedLabelColor: AcnooAppColors.kNeutralColor500,
          labelColor: AcnooAppColors.kPrimaryColor700,
          labelPadding: REdgeInsets.symmetric(horizontal: 24, vertical: 6),
          indicatorColor: AcnooAppColors.kPrimaryColor700,
          tabs: List.generate(
            tabs.length,
            (index) => Tab(
              child: Text(
                tabs[index],
                style: AcnooTextStyle.kBodyMd
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Text.rich(
                TextSpan(
                    text: 'Wow! ',
                    style: AcnooTextStyle.kBodySm
                        .copyWith(color: AcnooAppColors.kNeutralColor500),
                    children: [
                      TextSpan(
                        text: '70 Results ',
                        style: AcnooTextStyle.kBodySm
                            .copyWith(color: AcnooAppColors.kNeutralColor900),
                      ),
                      TextSpan(
                        text: 'found for ',
                        style: AcnooTextStyle.kBodySm
                            .copyWith(color: AcnooAppColors.kNeutralColor500),
                      ),
                      TextSpan(
                        text: 'Apartments Rent',
                        style: AcnooTextStyle.kBodySm
                            .copyWith(color: AcnooAppColors.kNeutralColor900),
                      ),
                    ]),
              ),
            ),
            RSizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: AcnooDemoProperties.properties.length,
                itemBuilder: (context, index) {
                  final property = AcnooDemoProperties.properties[index];
                  return Padding(
                    padding: REdgeInsets.only(left: 24, right: 24, bottom: 16),
                    child: Obx(
                      () => AcnooPropertyCard(
                        ontap: () =>
                            Get.toNamed('/property-details', arguments: {
                          'property': AcnooDemoProperties.properties[index],
                        }),
                        favBtn: InkWell(
                          onTap: () {
                            if (controller.favController.favList
                                .contains(property)) {
                              controller.favController.favList.remove(property);
                              print('Already Added');
                            } else {
                              controller.favController.favList.add(property);
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
                        address: AcnooDemoProperties.properties[index].address,
                        bathRooms:
                            AcnooDemoProperties.properties[index].bathRooms,
                        bedRooms:
                            AcnooDemoProperties.properties[index].bedRooms,
                        flatArea:
                            AcnooDemoProperties.properties[index].flatArea,
                        rentPerMonth:
                            AcnooDemoProperties.properties[index].price,
                        title: AcnooDemoProperties.properties[index].title,
                        propertyImage:
                            AcnooDemoProperties.properties[index].imageUrl,
                        landlordName:
                            AcnooDemoProperties.properties[index].ownerName,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Filter Modal sheet
class FilterModalSheet extends GetView<AcnooSearchResultController> {
  const FilterModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 62.h,
          padding: REdgeInsets.symmetric(horizontal: 24),
          color: Color(0xffF7F7F7),
          child: Column(
            children: [
              Container(
                height: 4.h,
                width: 32.w,
                margin: REdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: AcnooAppColors.kNeutralColor300,
                    borderRadius: BorderRadius.circular(24)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter',
                    style: AcnooTextStyle.kBodyLg
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text('Clear All',
                          style: AcnooTextStyle.kBodySm.copyWith(
                              color: AcnooAppColors.kPrimaryColor700)))
                ],
              ),
            ],
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                        text: 'You are searching in ',
                        style: AcnooTextStyle.kBodySm
                            .copyWith(color: AcnooAppColors.kNeutralColor600),
                        children: [
                          TextSpan(
                            text: controller.args['searchFieldValue'],
                            style: AcnooTextStyle.kBodySm.copyWith(
                                color: AcnooAppColors.kNeutralColor900),
                          )
                        ]),
                  ),
                  RSizedBox(height: 8),
                  InkWell(
                    child: Row(
                      children: [
                        Text(
                          'Change location',
                          style: AcnooTextStyle.kBodySm
                              .copyWith(color: AcnooAppColors.kPrimaryColor700),
                        ),
                        RSizedBox(width: 6),
                        Icon(BootstrapIcons.chevron_right,
                            size: 16.sp, color: AcnooAppColors.kPrimaryColor700)
                      ],
                    ),
                  ),
                  RSizedBox(height: 24),

                  //Buy or Rent Button
                  Text(
                    'I’m Looing to',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 24 / 2),
                  Row(
                    children: List.generate(
                      2,
                      (index) => Padding(
                        padding: REdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () => controller.isBuy.value = index,
                          child: Obx(
                            () => Container(
                              padding: REdgeInsets.symmetric(
                                  horizontal: 18, vertical: 8),
                              decoration: BoxDecoration(
                                color: controller.isBuy.value != index
                                    ? AcnooAppColors.kWhite
                                    : Color(0xffF0EDFE),
                                border: controller.isBuy.value != index
                                    ? Border.all(
                                        color: AcnooAppColors.kNeutralColor200)
                                    : null,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                index == 0 ? 'Buy' : 'Rent',
                                style: AcnooTextStyle.kBodyMd.copyWith(
                                  color: controller.isBuy.value == index
                                      ? AcnooAppColors.kPrimaryColor700
                                      : AcnooAppColors.kNeutralColor600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RSizedBox(height: 24),

                  //Property Size
                  Text(
                    'Property Size',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 16),
                  Obx(
                    () => SfRangeSlider(
                      enableTooltip: true,
                      showLabels: true,
                      values: controller.propertySize.value,
                      max: 5000,
                      min: 400,
                      startThumbIcon: AcnooThumbIcon(),
                      endThumbIcon: AcnooThumbIcon(),
                      activeColor: AcnooAppColors.kPrimaryColor700,
                      inactiveColor: Color(0xffF0EDFE),
                      labelFormatterCallback: (actualValue, formattedText) =>
                          '$formattedText Sqft',
                      onChanged: (value) {
                        controller.propertySize.value = value;
                      },
                    ),
                  ),

                  RSizedBox(height: 24),
                  Text(
                    'Property Type',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 16),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.propertyType.length,
                        (index) => Padding(
                          padding: REdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () => controller.selectedPropertyType.value =
                                controller.propertyType[index],
                            child: Obx(
                              () => Container(
                                padding: REdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedPropertyType.value !=
                                              controller.propertyType[index]
                                          ? AcnooAppColors.kWhite
                                          : Color(0xffF0EDFE),
                                  border: controller
                                              .selectedPropertyType.value !=
                                          controller.propertyType[index]
                                      ? Border.all(
                                          color:
                                              AcnooAppColors.kNeutralColor200)
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  controller.propertyType[index].toString(),
                                  style: AcnooTextStyle.kBodyMd.copyWith(
                                    color:
                                        controller.selectedPropertyType.value ==
                                                controller.propertyType[index]
                                            ? AcnooAppColors.kPrimaryColor700
                                            : AcnooAppColors.kNeutralColor600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RSizedBox(height: 24),

                  //Listed By
                  Text(
                    'Listed By',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 24 / 2),
                  Row(
                    children: List.generate(
                      2,
                      (index) => Padding(
                        padding: REdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () => controller.listedby.value = index,
                          child: Obx(
                            () => Container(
                              padding: REdgeInsets.symmetric(
                                  horizontal: 18, vertical: 8),
                              decoration: BoxDecoration(
                                color: controller.listedby.value != index
                                    ? AcnooAppColors.kWhite
                                    : Color(0xffF0EDFE),
                                border: controller.listedby.value != index
                                    ? Border.all(
                                        color: AcnooAppColors.kNeutralColor200)
                                    : null,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                index == 0 ? 'Agent' : 'Landlord',
                                style: AcnooTextStyle.kBodyMd.copyWith(
                                  color: controller.listedby.value == index
                                      ? AcnooAppColors.kPrimaryColor700
                                      : AcnooAppColors.kNeutralColor600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RSizedBox(height: 24),

                  //Budget
                  Text(
                    'Budget',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 16),
                  Obx(
                    () => SfRangeSlider(
                      enableTooltip: true,
                      showLabels: true,
                      values: controller.budget.value,
                      max: 10000000,
                      min: 5000,
                      startThumbIcon: AcnooThumbIcon(),
                      endThumbIcon: AcnooThumbIcon(),
                      activeColor: AcnooAppColors.kPrimaryColor700,
                      inactiveColor: Color(0xffF0EDFE),
                      labelFormatterCallback: (actualValue, formattedText) =>
                          controller.formatLabelText(actualValue),
                      onChanged: (value) {
                        controller.budget.value = value;
                      },
                    ),
                  ),
                  RSizedBox(height: 24),

                  //Floor Range
                  Text(
                    'Floor Range',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 24 / 2),
                  Row(
                    children: List.generate(
                      controller.floorRange.length,
                      (index) => Padding(
                        padding: REdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () => controller.selectedFloorRange.value =
                              controller.floorRange[index],
                          child: Obx(
                            () => Container(
                              padding: REdgeInsets.symmetric(
                                  horizontal: 18, vertical: 8),
                              decoration: BoxDecoration(
                                color: controller.selectedFloorRange.value !=
                                        controller.floorRange[index]
                                    ? AcnooAppColors.kWhite
                                    : Color(0xffF0EDFE),
                                border: controller.selectedFloorRange.value !=
                                        controller.floorRange[index]
                                    ? Border.all(
                                        color: AcnooAppColors.kNeutralColor200)
                                    : null,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                controller.floorRange[index],
                                style: AcnooTextStyle.kBodyMd.copyWith(
                                  color: controller.selectedFloorRange.value ==
                                          controller.floorRange[index]
                                      ? AcnooAppColors.kPrimaryColor700
                                      : AcnooAppColors.kNeutralColor600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RSizedBox(height: 24),

                  //Bedrooms
                  Text(
                    'Bedrooms',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 24 / 2),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: REdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () =>
                                controller.selectedBedrooms.value = (index + 1),
                            child: Obx(
                              () => Container(
                                padding: REdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                decoration: BoxDecoration(
                                  color: controller.selectedBedrooms.value !=
                                          (index + 1)
                                      ? AcnooAppColors.kWhite
                                      : Color(0xffF0EDFE),
                                  border: controller.selectedBedrooms.value !=
                                          (index + 1)
                                      ? Border.all(
                                          color:
                                              AcnooAppColors.kNeutralColor200)
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '${index + 1}+',
                                  style: AcnooTextStyle.kBodyMd.copyWith(
                                    color: controller.selectedBedrooms.value ==
                                            (index + 1)
                                        ? AcnooAppColors.kPrimaryColor700
                                        : AcnooAppColors.kNeutralColor600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RSizedBox(height: 24),

                  //Bathrooms
                  Text(
                    'Bathrooms',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 24 / 2),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: REdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () => controller.selectedBathrooms.value =
                                (index + 1),
                            child: Obx(
                              () => Container(
                                padding: REdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                decoration: BoxDecoration(
                                  color: controller.selectedBathrooms.value !=
                                          (index + 1)
                                      ? AcnooAppColors.kWhite
                                      : Color(0xffF0EDFE),
                                  border: controller.selectedBathrooms.value !=
                                          (index + 1)
                                      ? Border.all(
                                          color:
                                              AcnooAppColors.kNeutralColor200)
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '${index + 1}+',
                                  style: AcnooTextStyle.kBodyMd.copyWith(
                                    color: controller.selectedBathrooms.value ==
                                            (index + 1)
                                        ? AcnooAppColors.kPrimaryColor700
                                        : AcnooAppColors.kNeutralColor600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RSizedBox(height: 24),

                  //Facilities
                  Text(
                    'Facilities',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 24 / 2),
                  Row(
                    children: [
                      buildCheckboxRow("Parking",
                          () => controller.facilities["Parking"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Parking"]!.value = newValue;
                        }
                      }),
                      buildCheckboxRow("Security",
                          () => controller.facilities["Security"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Security"]!.value = newValue;
                        }
                      }),
                    ],
                  ),

                  Row(
                    children: [
                      buildCheckboxRow(
                          "Lift", () => controller.facilities["Lift"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Lift"]!.value = newValue;
                        }
                      }),
                      buildCheckboxRow("Swimming Pool",
                          () => controller.facilities["Swimming Pool"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Swimming Pool"]!.value =
                              newValue;
                        }
                      }),
                    ],
                  ),

                  Row(
                    children: [
                      buildCheckboxRow("Playground",
                          () => controller.facilities["Playground"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Playground"]!.value = newValue;
                        }
                      }),
                      buildCheckboxRow("Gymnasium",
                          () => controller.facilities["Gymnasium"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Gymnasium"]!.value = newValue;
                        }
                      }),
                    ],
                  ),

                  Row(
                    children: [
                      buildCheckboxRow(
                          "Sauna", () => controller.facilities["Sauna"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Sauna"]!.value = newValue;
                        }
                      }),
                      buildCheckboxRow("Barbeque area",
                          () => controller.facilities["Barbeque area"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Barbeque area"]!.value =
                              newValue;
                        }
                      }),
                    ],
                  ),

                  Row(
                    children: [
                      buildCheckboxRow("Minimart",
                          () => controller.facilities["Minimart"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Minimart"]!.value = newValue;
                        }
                      }),
                      buildCheckboxRow(
                          "Multipurpose hall",
                          () =>
                              controller.facilities["Multipurpose hall"]!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.facilities["Multipurpose hall"]!.value =
                              newValue;
                        }
                      }),
                    ],
                  ),

                  RSizedBox(height: 24 / 2),
                  //Amenities
                  Text(
                    'Amenities ',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      buildCheckboxRow('Air - Cond',
                          () => controller.amenities['Air - Cond']!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.amenities["Air - Cond"]!.value = newValue;
                        }
                      }),
                      buildCheckboxRow('Cooking Allowed',
                          () => controller.amenities['Cooking Allowed']!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.amenities["Cooking Allowed"]!.value =
                              newValue;
                        }
                      })
                    ],
                  ),
                  Row(
                    children: [
                      buildCheckboxRow('Near KTM/LRT',
                          () => controller.amenities['Near KTM/LRT']!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.amenities["Near KTM/LRT"]!.value =
                              newValue;
                        }
                      }),
                      buildCheckboxRow('Washing Machine',
                          () => controller.amenities['Washing Machine']!.value,
                          (bool? newValue) {
                        if (newValue != null) {
                          controller.amenities["Washing Machine"]!.value =
                              newValue;
                        }
                      })
                    ],
                  ),
                  buildCheckboxRow(
                      'Internet', () => controller.amenities['Internet']!.value,
                      (bool? newValue) {
                    if (newValue != null) {
                      controller.amenities["Internet"]!.value = newValue;
                    }
                  })
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
              color: AcnooAppColors.kWhite,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: TextButton(
              onPressed: () {},
              style: AcnooButtonStyle.kPrimaryTextButton,
              child: Text('View Properties')),
        )
      ],
    );
  }

  Widget buildCheckboxRow(String checkboxTitle, bool Function() getValue,
      void Function(bool?) onChanged) {
    return Row(
      children: [
        Container(
          height: 24.h,
          width: 155.w,
          margin: REdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Obx(() => RSizedBox(
                    height: 16,
                    width: 16,
                    child: Checkbox(
                      value: getValue(),
                      onChanged: onChanged,
                    ),
                  )),
              RSizedBox(width: 8),
              Text(
                checkboxTitle,
                style: AcnooTextStyle.kCaption
                    .copyWith(color: AcnooAppColors.kNeutralColor600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AcnooThumbIcon extends StatelessWidget {
  const AcnooThumbIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AcnooAppColors.kWhite,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AcnooAppColors.kPrimaryColor700,
        ),
      ),
    );
  }
}
