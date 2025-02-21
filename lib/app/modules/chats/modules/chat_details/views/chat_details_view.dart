import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/modules/chats/modules/chat_details/widgets/chat_bubble.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';

import '../../../../../widgets/constants.dart';
import '../controllers/chat_details_controller.dart';
import '../data/demo_chat_data.dart';

class ChatDetailsView extends GetView<ChatDetailsController> {
  const ChatDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: REdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              controller.args['profileImage'],
              RSizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user.key,
                    style: AcnooTextStyle.kBodySm
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  RSizedBox(height: 4),
                  Text(
                    "${controller.user.value['Status']}",
                    style: AcnooTextStyle.kCaption
                        .copyWith(color: AcnooAppColors.kNeutralColor500),
                  )
                ],
              )
            ],
          ),
        ),
        actions: [
          PopupMenuButton(
            offset: const Offset(-10, 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () => Future.delayed(
                      Duration.zero,
                      () => showDialog(
                            context: context,
                            builder: (context) => BlockUserPopup(userName: ''),
                          )),
                  child: Text('Block', style: AcnooTextStyle.kBodySm)),
              PopupMenuItem(
                  child: Text('Report', style: AcnooTextStyle.kBodySm)),
            ],
          )
        ],
      ),
      body: AcnooScaffoldContainer(
        //Selected Property
        topBar: Padding(
          padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Container(
            padding: REdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AcnooAppColors.kWhite,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: AcnooAppColors.kNeutralColor300,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 1.5,
                    spreadRadius: 0.5),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(controller.property.imageUrl),
                    ),
                  ),
                ),
                RSizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rent for Apartments',
                        style: AcnooTextStyle.kCaption.copyWith(
                            fontSize: 10.sp,
                            color: AcnooAppColors.kNeutralColor600),
                      ),
                      RSizedBox(height: 2),
                      Text.rich(
                        TextSpan(
                          text:
                              "\$${AcnooCommonUtils.formatNumberWithCommas(controller.property.price)} ",
                          style: AcnooTextStyle.kBodyMd.copyWith(
                              color: AcnooAppColors.kPrimaryColor700,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: '/1 month',
                              style: AcnooTextStyle.kBodySm.copyWith(
                                  fontSize: 10.sp,
                                  color: AcnooAppColors.kNeutralColor500,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                      RSizedBox(height: 4),
                      Text(
                        controller.property.title,
                        style: AcnooTextStyle.kCaption
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 1.h,
                        margin: REdgeInsets.symmetric(vertical: 4),
                        color: AcnooAppColors.kNeutralColor300,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Landlord: ',
                          style: AcnooTextStyle.kCaption
                              .copyWith(color: AcnooAppColors.kNeutralColor600),
                          children: [
                            TextSpan(
                              text: controller.property.ownerName,
                              style: AcnooTextStyle.kCaption.copyWith(
                                  color: AcnooAppColors.kNeutralColor900),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AcnooAppColors.kScaffoldBackground,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: REdgeInsets.fromLTRB(20, 16, 20, 8),
                        controller: controller.customScrollController,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          AcnooChatModel data = controller.messages[index];

                          DateTime prev =
                              index != controller.messages.length - 1
                                  ? controller.messages[index + 1].date
                                  : controller.messages[index].date;
                          DateTime presn = controller.messages[index].date;

                          bool showTime =
                              presn.difference(prev).inMinutes != 0 ||
                                  index == controller.messages.length - 1;
                          return AcnooChatBubble(
                              profileImage: controller.args['profileImage'],
                              message: data,
                              showTime: showTime,
                              isActive: false);
                        }),
                  ),
                ),
                Container(
                  padding: REdgeInsets.fromLTRB(20, 16, 20, 12),
                  decoration: BoxDecoration(
                      color: AcnooAppColors.kWhite,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: AcnooAppColors.kNeutralColor400
                                .withOpacity(0.35),
                            spreadRadius: 1.5,
                            blurRadius: 2.5)
                      ]),
                  child: Row(
                    children: [
                      Visibility(
                        child: InkWell(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => AcnooImagePickerPopup(
                              galleryImage: () => controller.getImage(),
                            ),
                          ),
                          child: Container(
                            height: 50.h,
                            width: 50.h,
                            margin: REdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AcnooAppColors.kPrimaryColor500
                                    .withOpacity(0.25)),
                            child: Icon(FeatherIcons.link, size: 24.sp),
                          ),
                        ),
                      ),
                      Flexible(
                        child: RSizedBox(
                          height: 50,
                          child: TextFormField(
                            focusNode: controller.msgFocus,
                            controller: controller.messageEditingController,
                            decoration: AcnooInputDecoration.kSearchInput
                                .copyWith(
                                    filled: true,
                                    fillColor: const Color(0xffe8e8e8),
                                    hintText: 'Message...',
                                    hintStyle: AcnooTextStyle.kBodyMd,
                                    suffixIcon: IconButton(
                                        onPressed: () => controller.sendMsg(),
                                        iconSize: 24.sp,
                                        color: AcnooAppColors.kPrimaryColor700,
                                        icon: const Icon(Icons.send))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//-----------User blocking--------------//
class BlockUserPopup extends StatelessWidget {
  const BlockUserPopup({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: REdgeInsets.all(24),
      titlePadding: REdgeInsets.fromLTRB(20, 20, 20, 8),
      contentPadding: REdgeInsets.fromLTRB(20, 0, 20, 12),
      actionsPadding: REdgeInsets.fromLTRB(20, 12, 20, 20),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Block on Messenger',
              style:
                  AcnooTextStyle.kBodyLg.copyWith(fontWeight: FontWeight.w700)),
          InkResponse(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close,
                  size: 24.sp, color: AcnooAppColors.kNeutralColor600))
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'If you’re friens, blocking $userName, The conversation will stay in chats unless you hide it',
            style: AcnooTextStyle.kBodyMd
                .copyWith(color: AcnooAppColors.kNeutralColor600, height: 1.6),
          )
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: AcnooButtonStyle.kSecondaryButton.copyWith(
                      minimumSize: MaterialStateProperty.all(Size(366.w, 45.h)),
                      foregroundColor: const MaterialStatePropertyAll(
                          AcnooAppColors.kDangerMain),
                      textStyle: MaterialStatePropertyAll(AcnooTextStyle.kBodyMd
                          .copyWith(fontWeight: FontWeight.w600)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          side: const BorderSide(
                              color: AcnooAppColors.kDangerMain),
                          borderRadius: BorderRadius.circular(30)))),
                  child: const Text('Cancel')),
            ),
            const RSizedBox(width: 16),
            Expanded(
                child: TextButton(
                    onPressed: () {},
                    style: AcnooButtonStyle.kPrimaryTextButton.copyWith(
                      minimumSize: MaterialStateProperty.all(Size(366.w, 45.h)),
                    ),
                    child: const Text('Block')))
          ],
        )
      ],
    );
  }
}
