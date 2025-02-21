import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';

import '../controllers/acnoo_search_controller.dart';

class AcnooSearchView extends GetView<AcnooSearchController> {
  const AcnooSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text.rich(
          TextSpan(
              text: 'Search for ',
              style: AcnooTextStyle.kBodyLg
                  .copyWith(color: AcnooAppColors.kNeutralColor600),
              children: [
                TextSpan(
                  text: controller.args['q'],
                  style: AcnooTextStyle.kBodyLg
                      .copyWith(color: AcnooAppColors.kNeutralColor900),
                ),
                TextSpan(
                  text: ' in ',
                  style: AcnooTextStyle.kBodyLg
                      .copyWith(color: AcnooAppColors.kNeutralColor600),
                ),
                TextSpan(
                  text: controller.args['selectedCity'].toString(),
                  style: AcnooTextStyle.kBodyLg
                      .copyWith(color: AcnooAppColors.kNeutralColor900),
                ),
              ]),
        ),
      ),
      body: AcnooScaffoldContainer(
        topBar: Padding(
          padding: REdgeInsets.all(24),
          child: //----------Select Country-----------//
              TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
                controller: controller.searchFieldController,
                decoration: InputDecoration(
                    hintText: 'Search by localities & property name...',
                    suffixIcon: Padding(
                      padding: REdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          if (controller
                              .searchFieldController.text.isNotEmpty) {
                            Get.toNamed(
                              '/acnoo-search-result',
                              arguments: {
                                'searchFieldValue':
                                    controller.searchFieldController.text,
                                'isBuy': controller.args['q'] == 'Buy'
                                    ? true
                                    : false,
                              },
                            );
                          } else {
                            AcnooCommonUtils.showScaffoldToast(
                                context: context,
                                message: 'Search field can\'t empty');
                          }
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AcnooAppColors.kPrimaryColor700,
                              borderRadius: BorderRadius.circular(6)),
                          child: Icon(IconlyLight.search,
                              color: AcnooAppColors.kWhite, size: 20.sp),
                        ),
                      ),
                    ))),
            noItemsFoundBuilder: (context) => Padding(
              padding: REdgeInsets.fromLTRB(16, 12, 0, 12),
              child: Text('Property Not Found',
                  style: AcnooTextStyle.kBodyMd.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AcnooAppColors.kNeutralColor400)),
            ),
            suggestionsCallback: (pattern) {
              return controller.demoSuggestion(pattern);
            },
            itemBuilder: (context, itemData) {
              return Container(
                padding: REdgeInsets.only(left: 16, right: 16),
                color: AcnooAppColors.kNeutralColor100,
                child: Container(
                  padding: REdgeInsets.only(left: 2, top: 8, bottom: 10),
                  decoration: BoxDecoration(
                    color: AcnooAppColors.kNeutralColor200,
                    border: Border(
                      bottom:
                          BorderSide(color: AcnooAppColors.kNeutralColor300),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(IconlyLight.search, size: 20.sp),
                      RSizedBox(width: 6),
                      Text.rich(
                        TextSpan(
                            text: "$itemData\n",
                            style: AcnooTextStyle.kCaption
                                .copyWith(fontSize: 13.sp, height: 1.5),
                            children: [
                              TextSpan(
                                text: 'Anand Nagar, Andheri West, dhaka',
                                style: AcnooTextStyle.kCaption.copyWith(
                                    fontSize: 10.sp,
                                    color: AcnooAppColors.kNeutralColor600),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              );
            },
            onSuggestionSelected: (suggestion) {
              controller.searchFieldController.text = suggestion;
              Get.toNamed(
                '/acnoo-search-result',
                arguments: {'searchFieldValue': suggestion},
              );
            },
            hideKeyboardOnDrag: true,
            hideSuggestionsOnKeyboardHide: false,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.fromLTRB(24, 0, 24, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(FeatherIcons.crosshair,
                        size: 20.sp, color: AcnooAppColors.kPrimaryColor700),
                    RSizedBox(width: 8),
                    Text(
                      'Use my current location',
                      style: AcnooTextStyle.kBodySm
                          .copyWith(color: AcnooAppColors.kNeutralColor600),
                    ),
                    RSizedBox(width: 20),
                    Icon(BootstrapIcons.chevron_right,
                        size: 16.sp, color: AcnooAppColors.kPrimaryColor700),
                  ],
                ),
                RSizedBox(height: 24),
                Text(
                  'Popular Search',
                  style: AcnooTextStyle.kBodyMd
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Wrap(
                  children: List.generate(
                    controller.popularSearches.length,
                    (index) => Padding(
                      padding: REdgeInsets.only(top: 10, left: 10),
                      child: InkWell(
                        onTap: () {
                          controller.searchFieldController.text =
                              controller.popularSearches[index];
                        },
                        child: Container(
                          padding: REdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AcnooAppColors.kNeutralColor200,
                                  width: 1.5.w),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            controller.popularSearches[index],
                            style: AcnooTextStyle.kBodyMd.copyWith(
                                color: AcnooAppColors.kNeutralColor600),
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
      ),
    );
  }
}
