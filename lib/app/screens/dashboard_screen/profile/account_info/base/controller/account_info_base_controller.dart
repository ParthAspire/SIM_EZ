import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/model/response/profile_response_model.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';

class AccountInfoBaseController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();

  RxBool isReceiveEmail = true.obs;

  Rx<ProfileData> userDetails = ProfileData().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setIntentData({required dynamic intentData}) {
    try {
      userDetails.value = (intentData[0] as ProfileData);
      firstNameController.text =
          (userDetails.value.name ?? '').split(' ').first;
      lastNameController.text = (userDetails.value.name ?? '').split(' ').last;
      emailIdController.text = userDetails.value.email ?? '';
    } catch (e) {
      LoggerUtils.logException('setIntentData', e);
    }
  }

  void navigateToChangePasswordScreen() {
    FocusScope.of(Get.context!).unfocus();
    Get.toNamed(kRouteChangePasswordScreen);
  }

  void navigateToChangeEmailScreen() {
    Get.toNamed(kRouteChangeEmailScreen);
    // Get.toNamed(kRouteCreatePasswordScreen);
  }
}
