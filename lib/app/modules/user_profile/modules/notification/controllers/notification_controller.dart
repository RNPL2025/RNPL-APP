import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../data/demo_notification.dart';

class NotificationController extends GetxController {
  RxBool muteNotification = false.obs;

  Map<String, List<AcnooNotificationModel>> groupNotificationsByDate() {
    final groupedNotifications = <String, List<AcnooNotificationModel>>{};

    for (final notification in AcnooNotificationList.notificationList) {
      final date = notification.notiDate;
      final formattedDate = formatCurrentDate(date: date);

      if (groupedNotifications.containsKey(formattedDate)) {
        groupedNotifications[formattedDate]!.add(notification);
      } else {
        groupedNotifications[formattedDate] = [notification];
      }
    }

    groupedNotifications.forEach((key, value) {
      value.sort((a, b) => a.notiDate.compareTo(b.notiDate));
    });

    return groupedNotifications;
  }

  String formatCurrentDate({required DateTime date}) {
    final compareDate = DateTime(date.year, date.month, date.day);

    final today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (today == compareDate) {
      return 'Today';
    } else if (yesterday == compareDate) {
      return 'Yesterday';
    } else {
      return DateFormat('dd MMM').format(date);
    }
  }

  late var groupedNotifications;
  @override
  void onInit() {
    super.onInit();
    groupedNotifications = groupNotificationsByDate();
  }
}
