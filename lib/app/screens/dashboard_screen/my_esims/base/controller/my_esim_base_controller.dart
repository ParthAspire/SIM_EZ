import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/utils/local_storage.dart';

class MyESimBaseController extends GetxController {
  LocalStorage localStorage = Get.put(LocalStorage());
  RxString userName = 'UserName'.obs;

  RxInt currentIndex = 0.obs;

  RxBool isLoggedIn = false.obs;

  TextEditingController searchController = TextEditingController();

  @override
  Future<void> onInit() async {
    isLoggedIn.value =
        await localStorage.getBoolFromStorage(kStorageIsLoggedIn);
    Get.find<LocalStorage>().isLoggedIn.listen((p0) {
      isLoggedIn.value = p0;
    });
    super.onInit();
  }

  void navigateToPurchasedSimInfoScreen() {
    Get.offAllNamed(kRoutePurchasedSimInfoScreen);
  }

  void navigateToLoginScreen() {
    Get.toNamed(kRouteMainAuthScreen);
  }
}
