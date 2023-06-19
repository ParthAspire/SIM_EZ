import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/user_repo.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/model/response/profile_response_model.dart';
import 'package:sim_ez/app/utils/local_storage.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';

class StoreBaseController extends GetxController {
  RxString userName = ''.obs;
  RxInt currentIndex = 0.obs;

  LocalStorage localStorage = Get.put(LocalStorage());

  Rx<ProfileData> userDetails = ProfileData().obs;


  RxBool isLoggedIn = false.obs;


  TextEditingController searchController = TextEditingController();

  @override
  Future<void> onInit() async {
    Get.lazyPut(() => UserRepo(),fenix: true);
    isLoggedIn.value =
    await localStorage.getBoolFromStorage(kStorageIsLoggedIn);
    Get.find<LocalStorage>().isLoggedIn.listen((p0) {
      isLoggedIn.value = p0;
      getUserDetailsFromServer();
    });
    await getUserDetailsFromServer();
    super.onInit();
  }

  getUserDetailsFromServer() async {
    try {
      var response = await Get.find<UserRepo>().getUserDetailsApiCall();

      if (response != null && response.responseData != null) {
        userDetails.value = response.responseData!;
        userName.value = userDetails.value.name??'';
      }
    } catch (e) {
      LoggerUtils.logException('getUserDetailsFromServer', e);
    }
  }

  void navigateToSelectedCountrySimsScreen() {
    Get.toNamed(kRouteSelectedCountrySimsScreen);
  }
}
