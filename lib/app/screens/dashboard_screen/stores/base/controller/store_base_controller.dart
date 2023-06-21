import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  RxBool isShowLoader = true.obs;

  ScrollController globalSimListController = ScrollController();

  TextEditingController searchController = TextEditingController();
  RxBool isShowFab = true.obs;

  @override
  Future<void> onInit() async {
    Get.lazyPut(() => UserRepo(), fenix: true);
    isLoggedIn.value =
        await localStorage.getBoolFromStorage(kStorageIsLoggedIn);
    Get.find<LocalStorage>().isLoggedIn.listen((p0) {
      isLoggedIn.value = p0;
      getUserDetailsFromServer();
      // currentIndex.value = 0;
    });
    await getUserDetailsFromServer();


    globalSimListController.addListener(() {
      if (globalSimListController.position.userScrollDirection == ScrollDirection.reverse) {
        isShowFab.value = false;
      } else if (globalSimListController.position.userScrollDirection == ScrollDirection.forward) {
        isShowFab.value= true;
      }
      // if (globalSimListController.position.userScrollDirection ==
      //     ScrollDirection.reverse) {

        // if (isShowFab.value != false) {
        //   isShowFab.value = false;
        // }
        // else {
        //   if(isShowFab.value!=true){
        //     isShowFab.value =true;
        //   }
        // }
      // }
    });
    super.onInit();
  }

  getUserDetailsFromServer() async {
    try {
      var response = await Get.find<UserRepo>().getUserDetailsApiCall();

      if (response != null && response.responseData != null) {
        userDetails.value = response.responseData!;
        userName.value = userDetails.value.name ?? '';
      }
    } catch (e) {
      LoggerUtils.logException('getUserDetailsFromServer', e);
    }
  }

  void navigateToSelectedCountrySimsScreen() {
    Get.toNamed(kRouteSelectedCountrySimsScreen);
  }

  void navigateToLoginScreen() {
    Get.toNamed(kRouteMainAuthScreen);
  }

  void navigateToSimInfoScreen() {
    Get.toNamed(kRouteSimInfoScreen);
  }

  void navigateToSecureCheckoutScreen() {
    Get.toNamed(kRouteSecureCheckoutScreen);
  }
}
