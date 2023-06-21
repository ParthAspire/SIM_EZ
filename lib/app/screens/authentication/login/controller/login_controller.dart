import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/auth_repo.dart';
import 'package:sim_ez/app/screens/authentication/login/model/request/login_request_model.dart';
import 'package:sim_ez/app/screens/authentication/login/model/request/social_media_login_request_model.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/view/bottom_nav_screen.dart';
import 'package:sim_ez/app/services/gmail_services.dart';
import 'package:sim_ez/app/utils/alert_message_utils.dart';
import 'package:sim_ez/app/utils/local_storage.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/regex_data.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

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
    isValidEmail.value = false;
    isValidPassword.value = false;
    emailIdController.text = '';
    passwordController.text = '';
    Get.find<LocalStorage>().isLoggedIn.value = false;
    super.onInit();
  }

  void navigateToDashboardScreen() {
    Get.find<LocalStorage>().writeBoolToStorage(kStorageIsLoggedIn, true);
    Get.find<LocalStorage>().isLoggedIn.value = true;
    Get.offAllNamed(kRouteBottomNavScreen);
    // Get.find<BottomNavController>().changeTabIndex(0);
    // Navigator.popAndPushNamed(Get.context!, kRouteBottomNavScreen);
    // Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (BuildContext context){
    //   return BottomNavScreen();
    // }));
  }

  void checkUserInput() {
    // navigateToDashboardScreen();
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

  void passwordValidation({bool isFocus = false}) {
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
    if (isValidEmail.value && isValidPassword.value && isFocus ==false) {
      checkUserInput();
    }
  }

  void navigateToForgotPasswordScreen() {
    Get.toNamed(kRouteForgotPasswordScreen);
  }

  /// get gmail data
  void gmailLogin() async {
    try {
      GoogleSignIn? gmailData = await GmailServices().handleSignIn();
      if (gmailData != null) {
        socialMediaLoginApi(
            name: gmailData.currentUser?.displayName ?? '',
            socialId: gmailData.currentUser?.id ?? '',
            loginType: 'google',
            emailId: gmailData.currentUser?.email ?? '');
      }
    } catch (e) {
      LoggerUtils.logException('gmailLogin', e);
    }
  }

  /// social media login api call
  Future<void> socialMediaLoginApi(
      {required String name,
      String? emailId,
      required String socialId,
      required String loginType}) async {
    try {
      var requestModel = SocialMediaLoginRequestModel(
        name: name,
        email: emailId,
        socialId: socialId,
        loginType: loginType,
      );
      var response = await Get.find<AuthRepo>()
          .socialMediaLoginApiCall(requestModel: requestModel);

      if (response != null) {
        Get.find<LocalStorage>()
            .writeStringToStorage(kStorageToken, response.token ?? '');
        Get.find<AlertMessageUtils>().showToastMessages(
            msg: 'Login Successfully',
            textStyle: TextStyles.k16kColorGreenBold700Arial);
        navigateToDashboardScreen();
      }
    } catch (e) {
      LoggerUtils.logException('socialMediaLoginApi', e);
    }
  }

  /// login api call
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
        Get.find<AlertMessageUtils>().showToastMessages(
            msg: 'Login Successfully',
            textStyle: TextStyles.k16kColorGreenBold700Arial);
        navigateToDashboardScreen();
      }
    } catch (e) {
      LoggerUtils.logException('callLoginApi', e);
    }
  }
}
