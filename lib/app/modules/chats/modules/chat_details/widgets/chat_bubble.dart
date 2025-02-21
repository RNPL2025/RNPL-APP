//-----------Chat Bubble Widget--------------//

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../widgets/constants.dart';
import '../data/demo_chat_data.dart';

class AcnooChatBubble extends StatelessWidget {
  const AcnooChatBubble(
      {Key? key,
      this.profileImage,
      required this.message,
      required this.showTime,
      required this.isActive})
      : super(key: key);

  final Widget? profileImage;
  final AcnooChatModel message;
  final bool showTime;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          !message.isSentByMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Visibility(
          visible: !message.isSentByMe,
          child: SizedBox(
              height: 44.h, width: 44.h, child: profileImage ?? SizedBox()),
        ),
        const RSizedBox(width: 12),
        Column(
          crossAxisAlignment: message.isSentByMe
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            message.text != null
                ? Container(
                    width: 210.w,
                    padding:
                        REdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                        color: message.isSentByMe
                            ? AcnooAppColors.kPrimaryColor700
                            : AcnooAppColors.kWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(20),
                          topRight: const Radius.circular(20),
                          bottomLeft: message.isSentByMe
                              ? const Radius.circular(20)
                              : const Radius.circular(0),
                          bottomRight: message.isSentByMe
                              ? const Radius.circular(0)
                              : const Radius.circular(20),
                        )),
                    child: Text(
                      message.text!,
                      style: AcnooTextStyle.kBodySm.copyWith(
                          color: message.isSentByMe
                              ? AcnooAppColors.kWhite
                              : AcnooAppColors.kNeutralColor900),
                    ))
                : Container(
                    height: 92.h,
                    width: 116.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(message.file!))),
                  ),
            Visibility(
                visible: showTime,
                child: Padding(
                  padding: REdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                    DateFormat('hh:mm a').format(message.date),
                    style: AcnooTextStyle.kCaption
                        .copyWith(color: AcnooAppColors.kNeutralColor600),
                  ),
                )),
            Visibility(visible: !showTime, child: const RSizedBox(height: 16))
          ],
        )
      ],
    );
  }
}
