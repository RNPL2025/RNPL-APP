import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rentpro/app/modules/user_profile/modules/notification/data/demo_notification.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';

import '../../../../../widgets/constants.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: false,
        actions: [
          PopupMenuButton(
            offset: const Offset(-20, 45),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () => Future.delayed(
                      Duration.zero, () => Get.dialog(MuteNotiPopup())),
                  child:
                      Text('Mute Notification', style: AcnooTextStyle.kBodySm)),
              PopupMenuItem(
                  child: Text('Clear All', style: AcnooTextStyle.kBodySm)),
            ],
          )
        ],
      ),
      body: AcnooScaffoldContainer(
        child: ListView.builder(
          padding: REdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          itemCount: controller.groupedNotifications.length,
          itemBuilder: (context, groupIndex) {
            final date =
                controller.groupedNotifications.keys.toList()[groupIndex];
            final List<AcnooNotificationModel> notifications =
                controller.groupedNotifications[date];

            return Padding(
              padding: REdgeInsets.only(top: groupIndex == 0 ? 16 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: AcnooTextStyle.kBodyMd
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: notifications.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () => Get.dialog(buildViewNotiPopup(
                                notificationModel: notifications[index])),
                            child: Container(
                              margin: REdgeInsets.only(
                                  top: index == 0 ? 16 : 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 46.h,
                                        width: 46.h,
                                        child: CircleAvatar(),
                                      ),
                                      const RSizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notifications[index].title,
                                            style: AcnooTextStyle.kBodySm
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          const RSizedBox(height: 4),
                                          (() {
                                            switch (
                                                controller.formatCurrentDate(
                                                    date: notifications[index]
                                                        .notiDate)) {
                                              case 'Today':
                                                return Text(
                                                  '${DateFormat('mm').format(notifications[index].notiDate)} min ago ${notifications[index].msg}',
                                                  style: AcnooTextStyle.kCaption
                                                      .copyWith(
                                                          color: AcnooAppColors
                                                              .kNeutralColor600),
                                                );
                                              default:
                                                return Text(
                                                  "${DateFormat('dd MMM').format(notifications[index].notiDate)} ${notifications[index].msg}",
                                                  style: AcnooTextStyle.kCaption
                                                      .copyWith(
                                                          color: AcnooAppColors
                                                              .kNeutralColor600),
                                                );
                                            }
                                          })(),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.circle,
                                    size: 8.sp,
                                    color: (() {
                                      switch (controller.formatCurrentDate(
                                          date:
                                              notifications[index].notiDate)) {
                                        case 'Today':
                                          return AcnooAppColors
                                              .kPrimaryColor700;
                                        default:
                                          return AcnooAppColors
                                              .kNeutralColor300;
                                      }
                                    })(),
                                  ),
                                ],
                              ),
                            ),
                          ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildViewNotiPopup(
      {required AcnooNotificationModel notificationModel}) {
    return Dialog(
      insetPadding: REdgeInsets.all(24),
      child: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: REdgeInsets.only(bottom: 8),
              margin: REdgeInsets.only(bottom: 13),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: AcnooAppColors.kNeutralColor300, width: 1.2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View Notification',
                    style: AcnooTextStyle.kBodyLg
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () => Get.close(1),
                    child: Container(
                      height: 32.h,
                      width: 32.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AcnooAppColors.kScaffoldBackground),
                      child: Icon(
                        Icons.close,
                        size: 20.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(notificationModel.title, style: AcnooTextStyle.kBodyMd),
            RSizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adip gravi iscing elit. Ultricies ',
              style: AcnooTextStyle.kBodySm
                  .copyWith(color: AcnooAppColors.kNeutralColor600),
            )
          ],
        ),
      ),
    );
  }
}

class MuteNotiPopup extends GetView<NotificationController> {
  const MuteNotiPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: REdgeInsets.all(24),
      child: Padding(
        padding: REdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: InkResponse(
                    onTap: () => Get.close(1),
                    child: Icon(MdiIcons.closeCircleOutline,
                        size: 24.sp, color: AcnooAppColors.kNeutralColor600))),
            Container(
                height: 100.h,
                width: 100.h,
                decoration: BoxDecoration(
                    color: const Color(0xff567DF4).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6)),
                child: Icon(FeatherIcons.bell,
                    size: 58.sp, color: const Color(0xff567DF4))),
            RSizedBox(height: 32),
            Text('Do not disturb', style: AcnooTextStyle.kHeading3),
            RSizedBox(height: 10),
            RSizedBox(
                width: ScreenUtil().screenWidth * 0.75,
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur elit. Interdum cons.',
                    textAlign: TextAlign.center,
                    style: AcnooTextStyle.kCaption
                        .copyWith(color: AcnooAppColors.kNeutralColor600))),
            SizedBox(height: 16.h),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.muteNotification.value ? 'On' : 'Off',
                        style: AcnooTextStyle.kBodyMd
                            .copyWith(color: AcnooAppColors.kNeutralColor600)),
                    AcnooSwitch.medium(
                        value: controller.muteNotification.value,
                        onChanged: (value) =>
                            controller.muteNotification.value = value),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
