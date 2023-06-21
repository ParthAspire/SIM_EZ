import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/auth_repo.dart';
import 'package:sim_ez/app/screens/authentication/otp/model/request/verify_otp_request_model.dart';
import 'package:sim_ez/app/utils/alert_message_utils.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ResetPasswordController extends GetxController {
  RxString emailId = ''.obs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isShowPassword = false.obs;
  RxBool isShowConfirmPassword = false.obs;

  RxBool isValidPassword = true.obs;
  RxBool isValidConfirmPassword = true.obs;

  RxString passwordErrorText = ''.obs;
  RxString confirmPasswordErrorText = ''.obs;

  @override
  void onInit() {
    Get.lazyPut(() => AuthRepo(), fenix: true);
    isValidPassword.value = false;
    isValidConfirmPassword.value = false;
    super.onInit();
  }

  void setIntentData({required dynamic intentData}) {
    try {
      emailId.value = (intentData[0] as String);
    } catch (e) {
      LoggerUtils.logException('setIntentData', e);
    }
  }

  void checkUserInput() {
    if (isValidPassword.value && isValidConfirmPassword.value) {
      FocusScope.of(Get.context!).unfocus();
      resetPasswordApiCall();
      // navigateToMainAuthScreen();
    } else {
      passwordValidation();
      confirmPasswordValidation();
    }
  }

  void passwordValidation() {
    isValidPassword.value = false;
    if (passwordController.text.trim().isNotEmpty) {
      if (passwordController.text.trim().length >= 8) {
        passwordErrorText.value = '';
        isValidPassword.value = true;
      } else {
        passwordErrorText.value = kValidPassword;
        isValidPassword.value = false;
      }
    } else {
      passwordErrorText.value = kEmptyPassword;
      isValidPassword.value = false;
    }
  }

  void confirmPasswordValidation({bool isFocus = false}) {
    isValidConfirmPassword.value = false;
    if (confirmPasswordController.text.trim().isNotEmpty) {
      if (confirmPasswordController.text.trim() ==
          passwordController.text.trim()) {
        confirmPasswordErrorText.value = '';
        isValidConfirmPassword.value = true;
      } else {
        confirmPasswordErrorText.value = kValidConfirmPassword;
        isValidConfirmPassword.value = false;
      }
    } else {
      confirmPasswordErrorText.value = kEmptyConfirmPassword;
      isValidConfirmPassword.value = false;
    }
    if (isValidConfirmPassword.value &&
        isValidConfirmPassword.value &&
        isFocus == false) {
      checkUserInput();
    }
  }

  resetPasswordApiCall() async {
    try {
      var requestModel = VerifyOtpRequestModel(
        email: emailId.value,
        password: passwordController.text.trim(),
      );
      var response = await Get.find<AuthRepo>()
          .resetPasswordApiCall(requestModel: requestModel);

      if (response == true) {
        navigateToMainAuthScreen();
      }
    } catch (e) {
      LoggerUtils.logException('resetPasswordApiCall', e);
    }
  }

  navigateToMainAuthScreen() {
    Get.back();
    Get.back();
    Get.back();
    Get.find<AlertMessageUtils>().showToastMessages(
        msg: 'Reset password Successfully',
        textStyle: TextStyles.k16kColorGreenBold700Arial);
    // Get.offAllNamed(kRouteMainAuthScreen);
  }
}
