import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/auth_repo.dart';
import 'package:sim_ez/app/screens/authentication/otp/model/request/verify_otp_request_model.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';

class OtpController extends GetxController {
  RxString name = ''.obs;
  RxString emailId = ''.obs;
  RxString password = ''.obs;
  RxString phoneNumber = ''.obs;

  TextEditingController otpController = TextEditingController();

  RxBool isOtpEntered = false.obs;
  RxString otpErrorText = ''.obs;

  @override
  void onInit() {
    Get.lazyPut(() => AuthRepo(), fenix: true);
    super.onInit();
  }

  void setIntentData({required dynamic intentData}) {
    try {
      name.value = (intentData[0] as String);
      emailId.value = (intentData[1] as String);
      password.value = (intentData[2] as String);
      // phoneNumber.value = (intentData[3] as String);
    } catch (e) {
      LoggerUtils.logException('setIntentData', e);
    }
  }

  void checkUserInput() {
    isOtpEntered.value = false;
    if (otpController.text.trim().isEmpty) {
      otpErrorText.value = kEmptyOtp;
    } else if (otpController.text.trim().length <= 3) {
      otpErrorText.value = kValidOtp;
    } else {
      otpErrorText.value = '';
      isOtpEntered.value = true;
      verifyOtpApiCall();
    }
  }

  Future<void> verifyOtpApiCall() async {
    try {
      var requestModel = VerifyOtpRequestModel(
          name: name.value,
          email: emailId.value,
          password: password.value,
          phoneNumber: phoneNumber.value);
      var response = await Get.find<AuthRepo>()
          .verifyOtpApiCall(requestModel: requestModel);

      if (response == true) {
        navigateToDashbaordScreen();
      }
    } catch (e) {
      LoggerUtils.logException('verifyOtpApiCall', e);
    }
  }

  void navigateToDashbaordScreen() {
    Get.offAllNamed(kRouteBottomNavScreen);
  }
}
