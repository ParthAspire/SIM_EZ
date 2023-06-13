import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/auth_repo.dart';
import 'package:sim_ez/app/screens/authentication/login/model/request/login_request_model.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/view/bottom_nav_screen.dart';
import 'package:sim_ez/app/utils/local_storage.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/regex_data.dart';

class LoginController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isShowPassword = false.obs;

  RxBool isValidEmail = true.obs;
  RxBool isValidPassword = true.obs;

  RxString emailErrorText = ''.obs;
  RxString passwordErrorText = ''.obs;

  @override
  void onInit() {
    Get.lazyPut(() => AuthRepo(), fenix: true);
    isValidEmail.value =false;
    isValidPassword.value =false;
    super.onInit();
  }

  void navigateToDashboardScreen() {
    Get.find<LocalStorage>().writeBoolToStorage(kStorageIsLoggedIn, true);
    Get.find<LocalStorage>().isLoggedIn.value = true;
    Navigator.popAndPushNamed(Get.context!, kRouteBottomNavScreen);
    // Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (BuildContext context){
    //   return BottomNavScreen();
    // }));
  }

  void checkUserInput() {
    // if (emailIdController.text.trim().isEmpty) {
    //   emailValidation();
    // } else if (passwordController.text.trim().isEmpty) {
    //   passwordValidation();
    // } else if (isValidEmail.value && isValidPassword.value) {
    //   callLoginApi();
    // } else {
    //   emailValidation();
    //   passwordValidation();
    // }

     if (isValidEmail.value && isValidPassword.value) {
      callLoginApi();
    } else {
      emailValidation();
      passwordValidation();
    }
  }

  Future<void> callLoginApi() async {
    try {
      var requestModel = LoginRequestModel(
        email: emailIdController.text.trim(),
        password: passwordController.text.trim(),
      );
      var response =
          await Get.find<AuthRepo>().loginApiCall(requestModel: requestModel);

      if (response != null) {
        Get.find<LocalStorage>()
            .writeStringToStorage(kStorageToken, response.token ?? '');
        navigateToDashboardScreen();
      }
    } catch (e) {
      LoggerUtils.logException('callLoginApi', e);
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
    if (isValidEmail.value && isValidPassword.value) {
      checkUserInput();
    }
  }
}
