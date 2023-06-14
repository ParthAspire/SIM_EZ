import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/utils/local_storage.dart';

import '../../../../../../common/local_storage_constants.dart';

class SelectedCountrySimsController extends GetxController {
  LocalStorage localStorage = Get.put(LocalStorage());
  bool isLoggedIn = false;

  RxBool isShowLoader = true.obs;

  @override
  Future<void> onInit() async {
    await checkUserLoggedInOrNot();
    super.onInit();
  }

  checkUserLoggedInOrNot() async {
    isShowLoader.value = false;
    isLoggedIn = await localStorage.getBoolFromStorage(kStorageIsLoggedIn);

    Get.find<LocalStorage>().isLoggedIn.listen((p0) {
      isLoggedIn = p0;
    });
    isShowLoader.value = false;
  }

  void navigateToSimInfoScreen() {
    Get.toNamed(kRouteSimInfoScreen);
  }

  void navigateToLoginScreen() {
    Get.toNamed(kRouteMainAuthScreen);
  }

  void navigateToSecureCheckoutScreen() {
    Get.toNamed(kRouteSecureCheckoutScreen);
  }
}
