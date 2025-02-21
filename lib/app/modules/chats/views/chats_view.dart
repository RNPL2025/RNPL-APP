import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rentpro/app/data/property/property.dart';
import 'package:rentpro/app/widgets/common_widgets.dart';
import 'package:rentpro/app/widgets/constants.dart';
import 'package:unicons/unicons.dart';

import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        centerTitle: false,
        actions: [
          Container(
            margin: REdgeInsets.fromLTRB(0, 6, 12, 6),
            padding: REdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AcnooAppColors.kNeutralColor400)),
            child: DropdownButtonHideUnderline(
              child: Obx(
                () => DropdownButton2(
                  iconStyleData:
                      IconStyleData(icon: Icon(UniconsLine.angle_down)),
                  dropdownStyleData: DropdownStyleData(offset: Offset(0, -12)),
                  value: controller.selectedFilter.value,
                  items: List.generate(
                    controller.filteringOptions.length,
                    (index) => DropdownMenuItem(
                      child: Text(
                        controller.filteringOptions[index],
                        style: AcnooTextStyle.kBodyMd
                            .copyWith(color: AcnooAppColors.kNeutralColor500),
                      ),
                      value: controller.filteringOptions[index],
                    ),
                  ),
                  onChanged: (value) {
                    controller.selectedFilter.value = value!;
                    controller.filterChat(value);
                  },
                ),
              ),
            ),
          )
        ],
      ),
      body: AcnooScaffoldContainer(
        child: ListView.builder(
            padding: REdgeInsets.all(24),
            itemCount: controller.demoChats.length,
            itemBuilder: (context, index) {
              String fullName = controller.demoChats.keys.toList()[index];
              List<String> splittedNames = fullName.split(' ');
              String firstName = splittedNames[0];
              String lastName =
                  splittedNames.length > 1 ? splittedNames[1] : '';
              final AcnooPropertyModel property =
                  AcnooDemoProperties.properties.first;
              return Padding(
                padding: REdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/chat-details', arguments: {
                      'property': property,
                      'user': controller.demoChats.entries.toList()[index],
                      'profileImage': ProfileImage(
                        firstName: firstName,
                        lastName: lastName,
                        isActive: controller.demoChats.values.toList()[index]
                            ['isActive'],
                      ),
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RSizedBox(
                        height: 44,
                        width: 44,
                        child: ProfileImage(
                          firstName: firstName,
                          lastName: lastName,
                          isActive: controller.demoChats.values.toList()[index]
                              ['isActive'],
                        ),
                      ),
                      RSizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: REdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: AcnooAppColors.kNeutralColor200,
                                  width: 1.5),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.demoChats.keys.toList()[index],
                                    style: AcnooTextStyle.kBodySm
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  RSizedBox(height: 4),
                                  Text(
                                    controller.demoChats.values.toList()[index]
                                        ['Status'],
                                    style: AcnooTextStyle.kCaption.copyWith(
                                        color: AcnooAppColors.kNeutralColor500),
                                  )
                                ],
                              ),
                              Text(
                                controller.demoChats.values.toList()[index]
                                    ['Sending-time'],
                                style: AcnooTextStyle.kCaption.copyWith(
                                    color: AcnooAppColors.kNeutralColor400,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.isActive,
  });

  final String firstName;
  final String lastName;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AcnooInitialsAvatar(
          firstName: firstName,
          lastName: lastName,
          backgroundColor: AcnooAppColors.kPrimaryColor700,
        ),
        Positioned(
          right: 2,
          bottom: 3,
          child: Container(
            height: 8.h,
            width: 8.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Color(0xff69B22A) : Color(0xffBFBFBF),
              border: Border.all(color: AcnooAppColors.kWhite, width: 1.5),
            ),
          ),
        )
      ],
    );
  }
}
