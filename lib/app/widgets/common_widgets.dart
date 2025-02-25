import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:unicons/unicons.dart';

import '../shared_controller/image_picker_controller.dart';
import 'constants.dart';

//Rounded Scaffold Container
class AcnooScaffoldContainer extends StatelessWidget {
  const AcnooScaffoldContainer(
      {super.key,
      required this.child,
      this.topBar,
      this.bodyBgColor,
      this.topBarBgColor});
  final Widget child;
  final Widget? topBar;
  final Color? bodyBgColor;
  final Color? topBarBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(top: 10),
      clipBehavior: Clip.antiAlias,
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
          color: bodyBgColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (topBar != null)
            DecoratedBox(
                decoration: BoxDecoration(color: topBarBgColor ?? Colors.white),
                child: topBar!),
          Expanded(
            child: DecoratedBox(
                decoration: BoxDecoration(color: bodyBgColor ?? Colors.white),
                child: child),
          )
        ],
      ),
    );
  }
}

//Image picker popup
class AcnooImagePickerPopup extends GetView<AcnooImagePickerController> {
  const AcnooImagePickerPopup({
    Key? key,
    this.galleryImage,
    this.cameraImage,
    this.popupTitle,
  }) : super(key: key);
  final String? popupTitle;
  final VoidCallback? galleryImage;
  final VoidCallback? cameraImage;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AcnooImagePickerController>(() => AcnooImagePickerController());
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: REdgeInsets.all(24),
      child: Padding(
        padding: REdgeInsets.fromLTRB(16, 12, 16, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(popupTitle ?? 'Choose', style: AcnooTextStyle.kBodyLg),
                InkResponse(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close, size: 24.sp))
              ],
            ),
            RSizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkResponse(
                  onTap: galleryImage,
                  child: Column(children: [
                    Container(
                      height: 56.h,
                      width: 56.h,
                      decoration: BoxDecoration(
                          color: AcnooAppColors.kPrimaryColor50,
                          borderRadius: BorderRadius.circular(7)),
                      child: Icon(
                        Icons.insert_photo,
                        size: 40,
                        color: AcnooAppColors.kPrimaryColor700,
                      ),
                    ),
                    RSizedBox(height: 6),
                    Text('Gallery',
                        style: AcnooTextStyle.kBodyLg
                            .copyWith(color: AcnooAppColors.kPrimaryColor700))
                  ]),
                ),
                RSizedBox(width: 60),
                InkResponse(
                  onTap: cameraImage,
                  child: Column(children: [
                    Container(
                      height: 56.h,
                      width: 56.h,
                      decoration: BoxDecoration(
                          color: AcnooAppColors.kPrimaryColor50,
                          borderRadius: BorderRadius.circular(7)),
                      child: Icon(
                        IconlyBold.camera,
                        size: 40,
                        color: AcnooAppColors.kNeutralColor400,
                      ),
                    ),
                    RSizedBox(height: 6),
                    Text('Camera',
                        style: AcnooTextStyle.kBodyLg
                            .copyWith(color: AcnooAppColors.kNeutralColor400))
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

//Property Card
class AcnooPropertyCard extends StatelessWidget {
  const AcnooPropertyCard(
      {Key? key,
      required this.propertyImage,
      required this.rentPerMonth,
      required this.title,
      required this.address,
      required this.bedRooms,
      required this.bathRooms,
      required this.flatArea,
      required this.landlordName,
      this.favBtn,
      this.ontap})
      : super(key: key);
  final String propertyImage;
  final int rentPerMonth;
  final String title;
  final String address;
  final int bedRooms;
  final int bathRooms;
  final int flatArea;
  final String landlordName;
  final Widget? favBtn;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 278.w,
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AcnooAppColors.kWhite,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AcnooAppColors.kNeutralColor200,
              blurStyle: BlurStyle.outer,
              blurRadius: 2.5,
              spreadRadius: 1.5,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 112.h,
              width: 100.w,
              margin: REdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(propertyImage))),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rent',
                            style: AcnooTextStyle.kCaption.copyWith(
                                fontSize: 10.sp,
                                color: AcnooAppColors.kNeutralColor500),
                          ),
                          Text.rich(TextSpan(
                              text:
                                  '\$${AcnooCommonUtils.formatNumberWithCommas(rentPerMonth)}',
                              style: AcnooTextStyle.kBodyMd.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AcnooAppColors.kPrimaryColor700),
                              children: [
                                TextSpan(
                                  text: ' /1 month',
                                  style: AcnooTextStyle.kCaption.copyWith(
                                      fontSize: 10.sp,
                                      color: AcnooAppColors.kNeutralColor500),
                                )
                              ])),
                        ],
                      ),
                      favBtn ?? SizedBox()
                    ],
                  ),
                  RSizedBox(height: 2),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AcnooTextStyle.kCaption
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  RSizedBox(height: 4),
                  Row(
                    children: [
                      Icon(IconlyBold.location,
                          size: 10.sp, color: AcnooAppColors.kNeutralColor500),
                      RSizedBox(width: 4),
                      Expanded(
                        child: Text(address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AcnooTextStyle.kCaption.copyWith(
                                fontSize: 10.sp,
                                color: AcnooAppColors.kNeutralColor500)),
                      )
                    ],
                  ),
                  RSizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(MdiIcons.bed,
                          size: 14.sp, color: AcnooAppColors.kNeutralColor500),
                      RSizedBox(width: 4),
                      Text("$bedRooms",
                          style: AcnooTextStyle.kCaption.copyWith(
                              fontSize: 10.sp,
                              color: AcnooAppColors.kNeutralColor500)),
                      RSizedBox(width: 10),
                      Icon(MdiIcons.bathtub,
                          size: 14.sp, color: AcnooAppColors.kNeutralColor500),
                      RSizedBox(width: 4),
                      Text('$bathRooms',
                          style: AcnooTextStyle.kCaption.copyWith(
                              fontSize: 10.sp,
                              color: AcnooAppColors.kNeutralColor500)),
                      RSizedBox(width: 10),
                      Icon(MdiIcons.windowMaximize,
                          size: 14.sp, color: AcnooAppColors.kNeutralColor500),
                      RSizedBox(width: 4),
                      Text('$flatArea Sqft',
                          style: AcnooTextStyle.kCaption.copyWith(
                              fontSize: 10.sp,
                              color: AcnooAppColors.kNeutralColor500)),
                      RSizedBox(width: 10),
                    ],
                  ),
                  Container(
                      margin: REdgeInsets.only(top: 5, bottom: 3),
                      height: 1.h,
                      color: AcnooAppColors.kNeutralColor200),
                  Text.rich(
                    TextSpan(
                        text: 'Landlord: ',
                        style: AcnooTextStyle.kCaption
                            .copyWith(color: AcnooAppColors.kNeutralColor500),
                        children: [
                          TextSpan(
                              text: landlordName,
                              style: AcnooTextStyle.kCaption.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AcnooAppColors.kNeutralColor800))
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Property Card V2
class AcnooPropertyCardV2 extends StatelessWidget {
  const AcnooPropertyCardV2({
    Key? key,
    required this.propertyImage,
    required this.propertyPrice,
    required this.title,
    required this.address,
    required this.bedRooms,
    required this.bathRooms,
    required this.flatArea,
    required this.landlordName,
    this.favBtn,
    this.ontap,
  }) : super(key: key);

  final String propertyImage;
  final int propertyPrice;
  final String title;
  final String address;
  final int bedRooms;
  final int bathRooms;
  final int flatArea;
  final String landlordName;
  final Widget? favBtn;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 228.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: AcnooAppColors.kWhite,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AcnooAppColors.kNeutralColor200)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 119.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(propertyImage))),
            ),
            Padding(
              padding: REdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Buy for House',
                            style: AcnooTextStyle.kCaption.copyWith(
                                fontSize: 10.sp,
                                color: AcnooAppColors.kNeutralColor500),
                          ),
                          RSizedBox(height: 2),
                          Text(
                            "\$${AcnooCommonUtils.formatNumberWithCommas(propertyPrice)}",
                            style: AcnooTextStyle.kBodySm.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AcnooAppColors.kPrimaryColor700),
                          ),
                        ],
                      ),
                      favBtn ?? SizedBox()
                    ],
                  ),
                  RSizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AcnooTextStyle.kCaption
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  RSizedBox(height: 4),
                  Row(
                    children: [
                      Icon(IconlyBold.location,
                          size: 10.sp, color: AcnooAppColors.kNeutralColor500),
                      RSizedBox(width: 4),
                      Text(address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AcnooTextStyle.kCaption.copyWith(
                              fontSize: 10.sp,
                              color: AcnooAppColors.kNeutralColor500))
                    ],
                  ),
                  RSizedBox(height: 4 * 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(MdiIcons.bed,
                          size: 14.sp, color: AcnooAppColors.kNeutralColor500),
                      RSizedBox(width: 4),
                      Text(bedRooms.toString(),
                          style: AcnooTextStyle.kCaption.copyWith(
                              fontSize: 10.sp,
                              color: AcnooAppColors.kNeutralColor500)),
                      RSizedBox(width: 10),
                      Icon(MdiIcons.bathtub,
                          size: 14.sp, color: AcnooAppColors.kNeutralColor500),
                      RSizedBox(width: 4),
                      Text(bathRooms.toString(),
                          style: AcnooTextStyle.kCaption.copyWith(
                              fontSize: 10.sp,
                              color: AcnooAppColors.kNeutralColor500)),
                      RSizedBox(width: 10),
                      Icon(MdiIcons.windowMaximize,
                          size: 14.sp, color: AcnooAppColors.kNeutralColor500),
                      RSizedBox(width: 4),
                      Text('$flatArea Sqft',
                          style: AcnooTextStyle.kCaption.copyWith(
                              fontSize: 10.sp,
                              color: AcnooAppColors.kNeutralColor500)),
                      RSizedBox(width: 10),
                    ],
                  ),
                  Container(
                      margin: REdgeInsets.only(top: 8, bottom: 6),
                      height: 1.h,
                      color: AcnooAppColors.kNeutralColor200),
                  Text.rich(
                    TextSpan(
                        text: 'Owner: ',
                        style: AcnooTextStyle.kCaption
                            .copyWith(color: AcnooAppColors.kNeutralColor500),
                        children: [
                          TextSpan(
                              text: landlordName,
                              style: AcnooTextStyle.kCaption.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AcnooAppColors.kNeutralColor800))
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//PaymentCard

class AcnooPaymentCard extends StatelessWidget {
  const AcnooPaymentCard({Key? key, required this.status}) : super(key: key);
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.fromLTRB(16, 16, 16, 24),
      margin: REdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AcnooAppColors.kWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#2365154',
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  RSizedBox(height: 4),
                  Text(
                    '4 BHK Independent Builder Floor',
                    style: AcnooTextStyle.kCaption.copyWith(
                        fontSize: 13.sp,
                        color: AcnooAppColors.kNeutralColor600),
                  )
                ],
              ),
              Text(
                '05 may 2023',
                style: AcnooTextStyle.kCaption.copyWith(
                    fontSize: 13.sp, color: AcnooAppColors.kNeutralColor600),
              )
            ],
          ),
          Divider(thickness: 1, color: AcnooAppColors.kNeutralColor300),
          buildInfoRow(title: 'Name', value: 'Shaidul Islam'),
          buildInfoRow(title: 'Email', value: 'shaidulislam@gmail.com'),
          buildInfoRow(title: 'Phone Number', value: '+60 112564585'),
          buildInfoRow(
            title: 'Status',
            value: status,
            valueStyle: AcnooTextStyle.kBodySm.copyWith(
                color: status == 'Unpaid'
                    ? Color(0xff144BD6)
                    : status == 'Paid'
                        ? AcnooAppColors.kPrimaryColor700
                        : AcnooAppColors.kWarningMain),
          ),
          buildInfoRow(title: 'Rent Amount', value: '\$700'),
          buildInfoRow(title: 'Unit Number', value: '5'),
          RSizedBox(height: 10),
          if (status == 'Unpaid')
            Column(
              children: [
                Container(
                  padding: REdgeInsets.fromLTRB(8, 8, 14, 8),
                  decoration: BoxDecoration(
                    color: AcnooAppColors.kWhite,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: AcnooAppColors.kNeutralColor300,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 1.5,
                          spreadRadius: 0.5),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 34.h,
                            width: 52.w,
                            padding: REdgeInsets.symmetric(
                                horizontal: 13, vertical: 5),
                            decoration: BoxDecoration(
                                color: AcnooAppColors.kScaffoldBackground,
                                borderRadius: BorderRadius.circular(5)),
                            child: Image.asset(
                                'assets/images/acnoo_assets/custom_icons/online_payment.png'),
                          ),
                          RSizedBox(width: 10),
                          Text(
                            'Online Payment',
                            style: AcnooTextStyle.kCaption
                                .copyWith(fontSize: 13.sp),
                          )
                        ],
                      ),
                      Icon(UniconsLine.angle_right,
                          color: AcnooAppColors.kNeutralColor500)
                    ],
                  ),
                ),
                RSizedBox(height: 12),
                InkWell(
                  onTap: () => Get.toNamed('/offline-payment'),
                  child: Container(
                    padding: REdgeInsets.fromLTRB(8, 8, 14, 8),
                    decoration: BoxDecoration(
                      color: AcnooAppColors.kWhite,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            color: AcnooAppColors.kNeutralColor300,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 1.5,
                            spreadRadius: 0.5),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 34.h,
                              width: 52.w,
                              padding: REdgeInsets.symmetric(
                                  horizontal: 13, vertical: 5),
                              decoration: BoxDecoration(
                                  color: AcnooAppColors.kScaffoldBackground,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Image.asset(
                                  'assets/images/acnoo_assets/custom_icons/offline_payment.png'),
                            ),
                            RSizedBox(width: 10),
                            Text(
                              'Offline Payment',
                              style: AcnooTextStyle.kCaption
                                  .copyWith(fontSize: 13.sp),
                            )
                          ],
                        ),
                        Icon(UniconsLine.angle_right,
                            color: AcnooAppColors.kNeutralColor500)
                      ],
                    ),
                  ),
                )
              ],
            )
          else
            InkWell(
              onTap: () => print('Printing lol'),
              child: Container(
                padding: REdgeInsets.fromLTRB(16, 12, 14, 12),
                decoration: BoxDecoration(
                  color: AcnooAppColors.kWhite,
                  border: Border.all(
                      color: AcnooAppColors.kPrimaryColor700, width: 1.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Print',
                      style: AcnooTextStyle.kBodyMd.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AcnooAppColors.kPrimaryColor700),
                    ),
                    Icon(Icons.print_outlined,
                        size: 24.sp, color: AcnooAppColors.kPrimaryColor700)
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget buildInfoRow(
      {required String title,
      required String value,
      TextStyle? titleStyle,
      TextStyle? valueStyle}) {
    return Container(
      margin: REdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RSizedBox(
            width: 140,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: titleStyle ??
                      AcnooTextStyle.kBodySm
                          .copyWith(color: AcnooAppColors.kNeutralColor600),
                ),
                Text(':   ', style: AcnooTextStyle.kBodySm)
              ],
            ),
          ),
          Expanded(
            child: Text(
              '$value',
              style: valueStyle ?? AcnooTextStyle.kBodySm,
            ),
          ),
        ],
      ),
    );
  }
}

//Acnoo Styled Custom Switch
class AcnooSwitch extends StatefulWidget {
  const AcnooSwitch._({
    required this.key,
    required this.value,
    required this.onChanged,
    required this.height,
    required this.width,
    required this.padding,
    required this.circleSize,
    this.activeTrackColor,
    this.activeThumbColor,
    this.inactiveTrackColor,
    this.inactiveThumbColor,
  }) : super(key: key);

  final Key? key;
  final bool value;
  final ValueChanged<bool> onChanged;
  final double height;
  final double width;
  final double padding;
  final double circleSize;
  final Color? activeTrackColor;
  final Color? activeThumbColor;
  final Color? inactiveTrackColor;
  final Color? inactiveThumbColor;

  // Large Switch
  const AcnooSwitch.large({
    Key? key,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color? activeTrackColor,
    Color? activeThumbColor,
    Color? inactiveTrackColor,
    Color? inactiveThumbColor,
  }) : this._(
          key: key,
          value: value,
          onChanged: onChanged,
          height: 22.0,
          width: 40.0,
          padding: 2,
          circleSize: 18.0,
          activeTrackColor: activeTrackColor,
          activeThumbColor: activeThumbColor,
          inactiveTrackColor: inactiveTrackColor,
          inactiveThumbColor: inactiveThumbColor,
        );

  // Medium Switch
  const AcnooSwitch.medium({
    Key? key,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color? activeTrackColor,
    Color? activeThumbColor,
    Color? inactiveTrackColor,
    Color? inactiveThumbColor,
  }) : this._(
          key: key,
          value: value,
          onChanged: onChanged,
          height: 18.0,
          width: 36.0,
          padding: 4.0,
          circleSize: 10.0,
          activeTrackColor: activeTrackColor,
          activeThumbColor: activeThumbColor,
          inactiveTrackColor: inactiveTrackColor,
          inactiveThumbColor: inactiveThumbColor,
        );

  // Small Switch
  const AcnooSwitch.small({
    Key? key,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color? activeTrackColor,
    Color? activeThumbColor,
    Color? inactiveTrackColor,
    Color? inactiveThumbColor,
  }) : this._(
          key: key,
          value: value,
          onChanged: onChanged,
          height: 14.0,
          width: 28.0,
          padding: 3.0,
          circleSize: 8.0,
          activeTrackColor: activeTrackColor,
          activeThumbColor: activeThumbColor,
          inactiveTrackColor: inactiveTrackColor,
          inactiveThumbColor: inactiveThumbColor,
        );

  @override
  State<AcnooSwitch> createState() => _AcnooSwitchState();
}

class _AcnooSwitchState extends State<AcnooSwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(14),
      child: GestureDetector(
        onTap: () {
          final newValue = !widget.value;
          widget.onChanged(newValue);
        },
        onPanEnd: (_) {
          final newValue = !widget.value;
          widget.onChanged(newValue);
        },
        child: AnimatedContainer(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.all(widget.padding),
          alignment:
              widget.value ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: widget.value
                ? widget.activeTrackColor ?? AcnooAppColors.kPrimaryColor700
                : widget.inactiveTrackColor,
            border: widget.value
                ? null
                : Border.all(color: const Color(0xff767676)),
            borderRadius: BorderRadius.circular(widget.width / 2),
          ),
          child: Container(
            height: widget.circleSize,
            width: widget.circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.value
                  ? widget.activeThumbColor ?? AcnooAppColors.kWhite
                  : widget.inactiveThumbColor ?? const Color(0xff767676),
            ),
          ),
        ),
      ),
    );
  }
}

//Acnoo Initial Avatar
class AcnooInitialsAvatar extends StatelessWidget {
  final String firstName;
  final String lastName;
  final double size;
  final Color backgroundColor;
  final Color textColor;

  AcnooInitialsAvatar({
    required this.firstName,
    required this.lastName,
    this.size = 44, // Updated size to 44
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    String firstInitial = firstName.isNotEmpty ? firstName[0] : '';
    String lastInitial = lastName.isNotEmpty ? lastName[0] : '';

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$firstInitial$lastInitial'.toUpperCase(),
          style: TextStyle(
            color: textColor,
            fontSize: size * 0.4,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
