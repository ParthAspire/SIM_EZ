import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/repository/user_repo.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/change_password/model/request/change_password_request_model.dart';
import 'package:sim_ez/app/utils/alert_message_utils.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  RxBool isShowPassword = false.obs;
  RxBool isShowNewPassword = false.obs;
  RxBool isShowConfirmPassword = false.obs;

  RxBool isValidOldPassword = true.obs;
  RxBool isValidPassword = true.obs;
  RxBool isValidConfirmPassword = true.obs;

  RxString oldPasswordErrorText = ''.obs;
  RxString newPasswordErrorText = ''.obs;
  RxString confirmPasswordErrorText = ''.obs;

  @override
  void onInit() {
    Get.lazyPut(() => UserRepo(), fenix: true);
    isValidOldPassword.value = false;
    isValidPassword.value = false;
    isValidConfirmPassword.value = false;
    super.onInit();
  }

  void checkUserInput() {
    if (isValidOldPassword.value &&
        isValidPassword.value &&
        isValidConfirmPassword.value) {
      changePasswordApiCall();
    } else {
      oldPasswordValidation();
      newPasswordValidation();
      confirmPasswordValidation();
    }
  }

  void oldPasswordValidation() {
    isValidOldPassword.value = false;
    if (oldPasswordController.text.trim().isNotEmpty) {
      if (oldPasswordController.text.trim().length >= 8) {
        oldPasswordErrorText.value = '';
        isValidOldPassword.value = true;
      } else {
        oldPasswordErrorText.value = kValidPassword;
        isValidOldPassword.value = false;
      }
    } else {
      oldPasswordErrorText.value = kEmptyOldPassword;
      isValidOldPassword.value = false;
    }
  }

  void newPasswordValidation() {
    isValidPassword.value = false;
    if (newPasswordController.text.trim().isNotEmpty) {
      if (newPasswordController.text.trim().length >= 8) {
        newPasswordErrorText.value = '';
        isValidPassword.value = true;
      } else {
        newPasswordErrorText.value = kValidPassword;
        isValidPassword.value = false;
      }
    } else {
      newPasswordErrorText.value = kEmptyNewPassword;
      isValidPassword.value = false;
    }
  }

  void confirmPasswordValidation() {
    isValidConfirmPassword.value = false;
    if (retypePasswordController.text.trim().isNotEmpty) {
      if (retypePasswordController.text.trim() ==
          newPasswordController.text.trim()) {
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
    if (isValidOldPassword.value &&
        isValidPassword.value &&
        isValidConfirmPassword.value) {
      checkUserInput();
    }
  }

  changePasswordApiCall() async {
    try {
      var requestModel = ChangePasswordRequestModel(
        oldPassword: oldPasswordController.text.trim(),
        newPassword: newPasswordController.text.trim(),
      );
      var respose = await Get.find<UserRepo>()
          .changePasswordApiCall(requestModel: requestModel);

      if (respose == true) {
        Get.back();
        Get.find<AlertMessageUtils>().showToastMessages(
            msg: 'Password changed successfully',
            textStyle: TextStyles.k16kColorGreenBold700Arial);
      }
    } catch (e) {
      LoggerUtils.logException('changePasswordApiCall', e);
    }
  }
}
