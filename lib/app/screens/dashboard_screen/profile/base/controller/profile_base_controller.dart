import 'package:get/get.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/utils/local_storage.dart';

class ProfileBaseController extends GetxController {
  LocalStorage localStorage = Get.put(LocalStorage());

  RxBool isLoggedIn = false.obs;


  RxString userName = 'UserName'.obs;

  Future<void> checkUserIsLoggedIn() async {
    isLoggedIn.value =
        await localStorage.getBoolFromStorage(kStorageIsLoggedIn);
    Get.find<LocalStorage>().isLoggedIn.value = isLoggedIn.value;
  }

  @override
  Future<void> onInit() async {
    await checkUserIsLoggedIn();
    Get.find<LocalStorage>().isLoggedIn.listen((p0) {
      isLoggedIn.value = p0;
    });
    super.onInit();
  }

  void navigateToAccountInfoScreen() {
    Get.toNamed(kRouteAccountInfoBaseScreen);
  }

  void navigateToContactUsScreen() {
    Get.toNamed(kRouteContactUsScreen);
  }

  void navigateToMoreInfoScreen() {
    Get.toNamed(kRouteMoreInfoScreen);
  }

  void navigateToOrdersScreen() {
    Get.toNamed(kRouteOrdersBaseScreen);
  }

  void navigateToLoginScreen() {
    Get.toNamed(kRouteMainAuthScreen);
  }

  void logOutAndClearStorage() {
    Get.find<LocalStorage>().clearAllStorageData();
    Get.find<LocalStorage>().isLoggedIn.value = false;
  }
}
