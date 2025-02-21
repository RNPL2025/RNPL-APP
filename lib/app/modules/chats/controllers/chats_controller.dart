import 'package:get/get.dart';

class ChatsController extends GetxController {
  Map<String, Map<String, dynamic>> demoChats = {
    "Savannah Nguyen": {
      'Status': 'Buying',
      'Sending-time': 'Just Now',
      'isActive': true,
    },
    "Jerome Bell": {
      'Status': 'Rent',
      'Sending-time': '4 hours ago',
      'isActive': false,
    },
    "Leslie Alexander": {
      'Status': 'Selling',
      'Sending-time': '2 days ago',
      'isActive': true,
    },
    "Kathryn Murphy": {
      'Status': 'Rent',
      'Sending-time': '1 week ago',
      'isActive': true,
    },
    "Marvin McKinney": {
      'Status': 'Rent',
      'Sending-time': '26 Jun 2023',
      'isActive': false,
    },
    "Dianne Russell": {
      'Status': 'Selling',
      'Sending-time': '26 Jun 2023',
      'isActive': true,
    },
    "Robert Fox": {
      'Status': 'Selling',
      'Sending-time': '27 Jun 2023',
      'isActive': true,
    },
    "Cameron Williamson": {
      'Status': 'Buying',
      'Sending-time': '29 Jun 2023',
      'isActive': false,
    },
    "Ronald Richards": {
      'Status': 'Buying',
      'Sending-time': '30 Jun 2023',
      'isActive': true,
    },
  };

  Map<String, Map<String, dynamic>> filteredChats = {};

  late RxString selectedFilter;
  List<String> filteringOptions = [
    "All Chats",
    "Buying",
    "Selling",
    "Rent",
  ];

//TODO: Fix filtering system
  void filterChat(String filter) {
    for (int i = 0; i < demoChats.length; i++) {
      var x = demoChats.values
          .toList()
          .where((element) => element.keys.toList()[i] == filter);
      print(x);
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedFilter = filteringOptions.first.obs;
  }
}
