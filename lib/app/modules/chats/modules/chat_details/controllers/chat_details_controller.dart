import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../data/property/property.dart';
import '../data/demo_chat_data.dart';

class ChatDetailsController extends GetxController {
  Map<String, dynamic> args = {};
  late MapEntry user;
  late AcnooPropertyModel property;

  RxList<AcnooChatModel> messages = AcnooDemoChat.chatList.obs;

  //---------For Picking and sending image----------//
  File? selectedImage;
  getImage() async {
    //To close the dialog and open gallery
    Get.close(1);

    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      sendImage();
    }
    return null;
  }

//---------For sending image----------//
  void sendImage() {
    messages.add(AcnooChatModel(
        file: selectedImage, date: DateTime.now(), isSentByMe: true));
    messageEditingController.clear();
  }

//---------For sending text msg----------//
  void sendMsg() {
    if (messageEditingController.text.isNotEmpty) {
      messages.add(AcnooChatModel(
          text: messageEditingController.text,
          date: DateTime.now(),
          isSentByMe: true));
      messageEditingController.clear();
    }
  }

  final ScrollController customScrollController = ScrollController();

  final TextEditingController messageEditingController =
      TextEditingController();
  late FocusNode msgFocus;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments as Map<String, dynamic>;
    property = args['property'] as AcnooPropertyModel;
    msgFocus = FocusNode();
    msgFocus.addListener(() {
      // msgFocus.hasFocus ? scrollController.position.maxScrollExtent : null;
    });
    user = args['user'] as MapEntry<String, Map<String, dynamic>>;
  }
}
