import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxBool isUpdate = false.obs;

  @override
  void onInit() {
    tabIndex.listen((p0) {
      tabIndex.value = p0;
    });
    super.onInit();
  }

  void changeTabIndex(int index) {
    isUpdate.value =!isUpdate.value;
    tabIndex.value = index;
    // if (tabIndex.value == 1) {
    //   // connectChatController.getMyChatRooms();
    // }
    // getNotificationCountFromServer();
    tabIndex.refresh();
  }
}
