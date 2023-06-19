import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/auth_repo.dart';
import 'package:sim_ez/app/screens/authentication/base/controller/main_auth_controller.dart';
import 'package:sim_ez/app/screens/authentication/otp/model/request/verify_otp_request_model.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:sim_ez/app/utils/alert_message_utils.dart';
import 'package:sim_ez/app/utils/local_storage.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class OtpController extends GetxController {
  RxString name = ''.obs;
  RxString emailId = ''.obs;
  RxString password = ''.obs;
  RxString phoneNumber = ''.obs;

  TextEditingController otpController = TextEditingController();

  RxBool isOtpEntered = false.obs;
  RxString otpErrorText = ''.obs;
  RxBool isFromForgotPassword = false.obs;

  @override
  void onInit() {
    Get.lazyPut(() => AuthRepo(), fenix: true);
    super.onInit();
  }

  void setIntentData({required dynamic intentData}) {
    try {
      /// while user come from forgot password screen
      if (intentData[3] == true) {
        emailId.value = (intentData[1] as String);
        isFromForgotPassword.value = (intentData[3] as bool);
      } else {
        name.value = (intentData[0] as String);
        emailId.value = (intentData[1] as String);
        password.value = (intentData[2] as String);
        // phoneNumber.value = (intentData[3] as String);
      }
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
      if (isFromForgotPassword.value) {
        verfiyForgotOtpApiCall();
      } else {
        verifyOtpApiCall();
      }
    }
  }

  Future<void> verifyOtpApiCall() async {
    try {
      var requestModel = VerifyOtpRequestModel(
        name: name.value,
        email: emailId.value,
        password: password.value,
        phoneNumber: phoneNumber.value,
        otp: otpController.text.trim(),
      );
      var response = await Get.find<AuthRepo>()
          .verifyOtpApiCall(requestModel: requestModel);

      if (response == true) {

        navigateToDashbaordScreen();
      }
    } catch (e) {
      LoggerUtils.logException('verifyOtpApiCall', e);
    }
  }

  verfiyForgotOtpApiCall() async {
    try {
      var requestModel = VerifyOtpRequestModel(
        email: emailId.value,
        otp: otpController.text.trim(),
      );
      var response = await Get.find<AuthRepo>()
          .verifyForgotPasswordApiCall(requestModel: requestModel);

      if (response == true) {
        Get.find<AlertMessageUtils>().showToastMessages(
            msg: 'OTP verified Successfully',
            textStyle: TextStyles.k16kColorGreenBold700Arial);
        navigateToResetPasswordScreen();
      }
    } catch (e) {
      LoggerUtils.logException('verfiyForgotOtpApiCall', e);
    }
  }

  void navigateToDashbaordScreen() {
    // Get.find<LocalStorage>().writeBoolToStorage(kStorageIsLoggedIn, true);
    // Get.find<LocalStorage>().isLoggedIn.value = true;
    Get.back();
    Get.find<SignUpController>().clearAllFields();
    Get.find<MainAuthController>().currentIndex.value = 0;
    Get.find<AlertMessageUtils>().showToastMessages(
        msg: 'OTP verified Successfully',
        textStyle: TextStyles.k16kColorGreenBold700Arial);
    // Get.back();
    // Get.offAllNamed(kRouteMainAuthScreen);
  }

  void navigateToResetPasswordScreen() {
    Get.toNamed(kRouteResetPasswordScreen, arguments: [emailId.value]);
  }
}
