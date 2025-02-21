class AcnooNotificationList {
  static List<AcnooNotificationModel> notificationList = [
    AcnooNotificationModel(
        title: 'Leslie Alexander',
        msg: '“New Message”',
        notiDate: DateTime.now().subtract(const Duration(minutes: 2))),
    AcnooNotificationModel(
        title: 'Arlene McCoy',
        msg: '“New Message”',
        notiDate: DateTime.now().subtract(const Duration(minutes: 5))),
    AcnooNotificationModel(
        title: 'Annette Black',
        msg: '“New Message”',
        notiDate: DateTime.now().subtract(const Duration(minutes: 7))),
    AcnooNotificationModel(
        title: 'Cody Fisher',
        msg: '“New Message”',
        notiDate: DateTime.now().subtract(const Duration(days: 1))),
    AcnooNotificationModel(
        title: 'Eleanor Pena',
        msg: '“New Message”',
        notiDate: DateTime.now().subtract(const Duration(days: 1))),
    AcnooNotificationModel(
        title: 'Promo Code',
        msg: 'MT#25698',
        notiDate: DateTime.now().subtract(const Duration(days: 2))),
    AcnooNotificationModel(
        title: 'Payment Alert',
        msg: 'Payment Declined',
        notiDate: DateTime.now().subtract(const Duration(days: 3))),
    AcnooNotificationModel(
        title: 'App Update',
        msg: 'Update available',
        notiDate: DateTime.now().subtract(const Duration(days: 5))),
  ];
}

class AcnooNotificationModel {
  final String title;
  final String msg;
  final DateTime notiDate;

  AcnooNotificationModel({
    required this.title,
    required this.msg,
    required this.notiDate,
  });
}
