import 'dart:io';

class AcnooDemoChat {
  static List<AcnooChatModel> chatList = [
    AcnooChatModel(
        text: 'Hello, we are trying to design UI/UX for app',
        date: DateTime.now().subtract(const Duration(hours: 2)),
        isSentByMe: false),
    AcnooChatModel(
        text: 'Oh, Hello Angela Young',
        date: DateTime.now().subtract(const Duration(hours: 1)),
        isSentByMe: true),
    AcnooChatModel(
        text: 'At first i need to know about your project details',
        date: DateTime.now().subtract(const Duration(hours: 1)),
        isSentByMe: true),
    AcnooChatModel(
        text: 'Yes sure, please wait',
        date: DateTime.now().subtract(const Duration(minutes: 5)),
        isSentByMe: false),
    AcnooChatModel(
        text: 'Can we talk about the project other platfrom',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
  ];
}

class AcnooChatModel {
  final File? file;
  final String? text;
  final DateTime date;
  final bool isSentByMe;
  final String? senderImage;

  AcnooChatModel(
      {this.file,
      this.text,
      required this.date,
      required this.isSentByMe,
      this.senderImage});
}
