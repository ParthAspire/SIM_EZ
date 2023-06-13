import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/auth_repo.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/model/request/send_otp_request_model.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/regex_data.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isShowPassword = false.obs;
  RxBool isShowConfirmPassword = false.obs;

  RxBool isValidName = true.obs;
  RxBool isValidEmail = true.obs;
  RxBool isValidPassword = true.obs;
  RxBool isValidConfirmPassword = true.obs;

  RxString nameErrorText = ''.obs;
  RxString emailErrorText = ''.obs;
  RxString passwordErrorText = ''.obs;
  RxString confirmPasswordErrorText = ''.obs;

  @override
  void onInit() {
    Get.lazyPut(() => AuthRepo(), fenix: true);
    isValidName.value = false;
    isValidEmail.value = false;
    isValidPassword.value = false;
    isValidConfirmPassword.value = false;
    super.onInit();
  }

  void checkUserInput() {
    sendOtpApiCall();
    if (isValidName.value &&
        isValidEmail.value &&
        isValidPassword.value &&
        isValidConfirmPassword.value) {
      sendOtpApiCall();
    } else {
      userNameValidation();
      emailValidation();
      passwordValidation();
      confirmPasswordValidation();
    }
  }

  void userNameValidation() {
    isValidName.value = false;
    if (nameController.text.trim().isNotEmpty) {
      nameErrorText.value = '';
      isValidName.value = true;
    } else {
      nameErrorText.value = kEmptyName;
      isValidName.value = false;
    }
  }

  void emailValidation() {
    isValidEmail.value = false;
    if (emailIdController.text.trim().isNotEmpty) {
      if (RegexData.emailNumberRegex.hasMatch(emailIdController.text.trim())) {
        emailErrorText.value = '';
        isValidEmail.value = true;
      } else {
        emailErrorText.value = kValidEmail;
        isValidEmail.value = false;
      }
    } else {
      emailErrorText.value = kEmptyEmail;
      isValidEmail.value = false;
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

  void confirmPasswordValidation() {
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
    if (isValidEmail.value &&
        isValidPassword.value &&
        isValidConfirmPassword.value &&
        isValidConfirmPassword.value) {
      checkUserInput();
    }
  }

  Future<void> sendOtpApiCall() async {
    try {
      var requestModel = SendOtpRequestModel(
        email: emailIdController.text.trim(),
      );
      var response =
          await Get.find<AuthRepo>().sendOtpApiCall(requestModel: requestModel);

      if (response == true) {
        navigateToOtpScreen();
      }
    } catch (e) {
      LoggerUtils.logException('sendOtpApiCall', e);
    }
  }

  void navigateToOtpScreen() {
    Get.toNamed(kRouteOtpScreen, arguments: [nameController.text.trim(),emailIdController.text.trim(),passwordController.text.trim()]);
  }
}
