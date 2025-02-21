import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';
import 'package:unicons/unicons.dart';

import '../../../../widgets/acnoo_country_service.dart';
import '../controllers/setup_profile_controller.dart';

class SetupProfileView extends GetView<SetupProfileController> {
  const SetupProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Up Your Profile')),
      bottomNavigationBar: Container(
        color: AcnooAppColors.kWhite,
        padding: REdgeInsets.fromLTRB(24, 0, 24, 16),
        child: TextButton(
            onPressed: () => controller.writeUserInfo(),
            style: AcnooButtonStyle.kPrimaryTextButton,
            child: Text("Continue")),
      ),
      body: AcnooScaffoldContainer(
          child: ListView(
        padding: REdgeInsets.fromLTRB(24, 30, 24, 12),
        children: [
          Text(
            'Complete your Profile with Professional Info',
            textAlign: TextAlign.center,
            style: AcnooTextStyle.kHeading2,
          ),
          RSizedBox(height: 30),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => AcnooCommonUtils.showScaffoldToast(
                      context: context, message: "You can't edit this here"),
                  child: TextFormField(
                    enabled: false,
                    initialValue:
                        controller.userController.currentUser.value.fullName,
                    decoration: AcnooInputDecoration.kDisabledInputDecoration
                        .copyWith(
                            labelText: 'Full Name',
                            hintText: 'Enter full name'),
                  ),
                ),
                RSizedBox(height: 16),
                InkWell(
                  onTap: () => AcnooCommonUtils.showScaffoldToast(
                      context: context, message: "You can't edit this here"),
                  child: TextFormField(
                    enabled: false,
                    initialValue:
                        controller.userController.currentUser.value.email,
                    decoration: AcnooInputDecoration.kDisabledInputDecoration
                        .copyWith(
                            labelText: 'Email', hintText: 'Enter your email'),
                  ),
                ),
                RSizedBox(height: 16),
                //----------Select Country-----------//
                TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: controller.countryController,
                      decoration: const InputDecoration(
                          labelText: 'Country',
                          hintText: 'Select your country',
                          suffixIcon: Icon(UniconsLine.angle_down))),
                  noItemsFoundBuilder: (context) => Padding(
                    padding: REdgeInsets.fromLTRB(16, 12, 0, 12),
                    child: Text('Country not found!',
                        style: AcnooTextStyle.kBodyMd.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AcnooAppColors.kNeutralColor400)),
                  ),
                  suggestionsCallback: (pattern) {
                    return AcnooCountryService.getSuggestion(pattern);
                  },
                  itemBuilder: (context, itemData) {
                    int index = AcnooCountryService.countries
                        .indexWhere((element) => element.name == itemData);
                    String flag =
                        AcnooCountryService.countries[index].flagEmoji;
                    return Padding(
                      padding: REdgeInsets.fromLTRB(16, 12, 0, 12),
                      child: Row(
                        children: [
                          Text("$flag   $itemData",
                              style: AcnooTextStyle.kBodyMd
                                  .copyWith(fontWeight: FontWeight.w400))
                        ],
                      ),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    controller.countryController.text = suggestion;
                    controller.setPhoneCode(suggestion);
                  },
                  hideKeyboardOnDrag: true,
                  hideSuggestionsOnKeyboardHide: false,
                ),
                const RSizedBox(height: 16),

                //----------Phone Number-----------//
                InputDecorator(
                  decoration: InputDecoration(
                      contentPadding: REdgeInsets.only(left: 12.0),
                      labelText: 'Mobile Number'),
                  child: TextFormField(
                    controller: controller.mobileNumController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration:
                        AcnooInputDecoration.kUnstyledInputDecoration.copyWith(
                      counterText: '',
                      hintText: '132465978',
                      prefixIcon: Container(
                        margin: REdgeInsets.only(left: 4, right: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(() => Text(
                                  '+${controller.countryPhoneCode}',
                                  style: AcnooTextStyle.kBodySm.copyWith(
                                      color: AcnooAppColors.kNeutralColor800),
                                )),
                            const RSizedBox(width: 10),
                            Container(
                                height: 20.h,
                                width: 2.w,
                                color: AcnooAppColors.kNeutralColor400)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                RSizedBox(height: 16),
                TextFormField(
                  controller: controller.addressController,
                  decoration: InputDecoration(
                      labelText: 'Address', hintText: 'Enter address'),
                ),
                RSizedBox(height: 16),
                TextFormField(
                  controller: controller.cityController,
                  decoration: InputDecoration(
                      labelText: 'City', hintText: 'Select city'),
                ),
                RSizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.stateController,
                        decoration: InputDecoration(
                            labelText: 'State', hintText: 'Select city'),
                      ),
                    ),
                    RSizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCodeController,
                        decoration: InputDecoration(
                            labelText: 'Postal Code',
                            hintText: 'Enter postal code'),
                      ),
                    ),
                  ],
                ),
                RSizedBox(height: 16),
                Row(
                  children: List<Widget>.generate(
                      controller.genderOptions.length,
                      (index) => Row(
                            children: [
                              Obx(() => SizedBox(
                                    height: 22,
                                    width: 56,
                                    child: Radio(
                                      value: index,
                                      groupValue: controller.gender.value,
                                      onChanged: (int? value) {
                                        if (value != null) {
                                          controller.gender.value = value;
                                        }
                                      },
                                    ),
                                  )),
                              Text(
                                controller.genderOptions[index],
                                style: AcnooTextStyle.kBodySm,
                              )
                            ],
                          )),
                ),
                RSizedBox(height: 24),
                TextFormField(
                  controller: controller.idNumberCodeController,
                  decoration: InputDecoration(
                      labelText: 'NID/Passport Number',
                      hintText: 'Enter NID/Passport number'),
                ),
                RSizedBox(height: 24),
                Text(
                  'Upload NID/Passport',
                  style: AcnooTextStyle.kBodyMd
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                RSizedBox(height: 12),
                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.idFrontImage.value != null
                              ? null
                              : Get.dialog(AcnooImagePickerPopup(
                                  galleryImage: () =>
                                      controller.getFrontImage(false),
                                  cameraImage: () =>
                                      controller.getFrontImage(true),
                                )),
                          child: DottedBorder(
                            radius: Radius.circular(6),
                            borderType: BorderType.RRect,
                            padding: EdgeInsets.zero,
                            child: Container(
                              height: 100.h,
                              width: 156.w,
                              padding: REdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: controller.idFrontImage.value == null
                                      ? null
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                              controller.idFrontImage.value!))),
                              child: controller.idFrontImage.value == null
                                  ? Align(
                                      child: Icon(IconlyBold.camera,
                                          size: 32.sp,
                                          color:
                                              AcnooAppColors.kNeutralColor400),
                                    )
                                  : Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () => controller
                                            .idFrontImage.value = null,
                                        child: Container(
                                          height: 20.h,
                                          width: 20.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AcnooAppColors
                                                  .kNeutralColor400),
                                          child: Icon(
                                            Icons.close,
                                            color: AcnooAppColors
                                                .kSecondaryColor600,
                                            size: 16.sp,
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                        ),
                      ),
                      RSizedBox(width: 16),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.idBackImage.value != null
                              ? null
                              : Get.dialog(AcnooImagePickerPopup(
                                  galleryImage: () =>
                                      controller.getBackImage(false),
                                  cameraImage: () =>
                                      controller.getBackImage(true),
                                )),
                          child: DottedBorder(
                            radius: Radius.circular(6),
                            borderType: BorderType.RRect,
                            padding: EdgeInsets.zero,
                            child: Container(
                              height: 100.h,
                              width: 156.w,
                              padding: REdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: controller.idBackImage.value == null
                                      ? null
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                              controller.idBackImage.value!))),
                              child: controller.idBackImage.value == null
                                  ? Align(
                                      child: Icon(IconlyBold.camera,
                                          size: 32.sp,
                                          color:
                                              AcnooAppColors.kNeutralColor400),
                                    )
                                  : Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () =>
                                            controller.idBackImage.value = null,
                                        child: Container(
                                          height: 20.h,
                                          width: 20.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AcnooAppColors
                                                  .kNeutralColor400),
                                          child: Icon(
                                            Icons.close,
                                            color: AcnooAppColors
                                                .kSecondaryColor600,
                                            size: 16.sp,
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
