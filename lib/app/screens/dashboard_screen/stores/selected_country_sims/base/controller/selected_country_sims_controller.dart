import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/utils/local_storage.dart';

import '../../../../../../common/local_storage_constants.dart';

class SelectedCountrySimsController extends GetxController {
  LocalStorage localStorage = Get.put(LocalStorage());
  RxBool isLoggedIn = false.obs;

  @override
  Future<void> onInit() async {
    isLoggedIn.value =
        await localStorage.getBoolFromStorage(kStorageIsLoggedIn);
    Get.find<LocalStorage>().isLoggedIn.listen((p0) {
      isLoggedIn.value = p0;
    });
    super.onInit();
  }

  void navigateToSimInfoScreen() {
    Get.toNamed(kRouteSimInfoScreen);
  }

  void navigateToLoginScreen() {
    Get.toNamed(kRouteMainAuthScreen);
  }
}
