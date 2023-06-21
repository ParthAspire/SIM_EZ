import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxBool isUpdate = false.obs;

  @override
  void onInit() {
    // tabIndex.value = 0;
    tabIndex.listen((p0) {
    //   tabIndex.value = p0;
      print('tab index :: ${tabIndex.value}');
    });
    super.onInit();
  }

  void changeTabIndex(int index) {
    isUpdate.value = !isUpdate.value;
    tabIndex.value = index;
    tabIndex.refresh();
    print('tab index :: ${tabIndex.value}');

    // if (tabIndex.value == 1) {
    //   // connectChatController.getMyChatRooms();
    // }
    // getNotificationCountFromServer();
  }
}
