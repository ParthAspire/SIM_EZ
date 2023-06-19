import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/auth_repo.dart';
import 'package:sim_ez/app/screens/authentication/login/model/request/social_media_login_request_model.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/model/request/send_otp_request_model.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:sim_ez/app/services/gmail_services.dart';
import 'package:sim_ez/app/utils/alert_message_utils.dart';
import 'package:sim_ez/app/utils/local_storage.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/regex_data.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

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
    if (isValidEmail.value &&
        isValidPassword.value &&
        isValidName.value &&
        isValidConfirmPassword.value &&
        emailIdController.text.trim().isNotEmpty &&
        nameController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty &&
        confirmPasswordController.text.trim().isNotEmpty) {
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
    print('isValidName :: ${isValidName.value}');
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
    print('isValidEmail :: ${isValidEmail.value}');
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
    print('isValidPassword :: ${isValidPassword.value}');
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
    print('isValidConfirmPassword :: ${isValidConfirmPassword.value}');
    if (isValidEmail.value &&
        isValidPassword.value &&
        isValidName.value &&
        isValidConfirmPassword.value &&
        emailIdController.text.trim().isNotEmpty &&
        nameController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty &&
        confirmPasswordController.text.trim().isNotEmpty) {
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
        Get.find<AlertMessageUtils>().showToastMessages(
            msg: 'OTP send Successfully',
            textStyle: TextStyles.k16kColorGreenBold700Arial);
        navigateToOtpScreen();
      }
    } catch (e) {
      LoggerUtils.logException('sendOtpApiCall', e);
    }
  }

  void navigateToOtpScreen() {
    Get.toNamed(
      kRouteOtpScreen,
      arguments: [
        nameController.text.trim(),
        emailIdController.text.trim(),
        passwordController.text.trim(),
        false,
      ],
    );
  }

  void navigateToForgotPasswordScreen() {
    Get.toNamed(kRouteForgotPasswordScreen);
  }

  clearAllFields() {
    nameController.text = '';
    emailIdController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
    isValidName.value = false;
    isValidEmail.value = false;
    isValidPassword.value = false;
    isValidConfirmPassword.value = false;
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
  void navigateToDashboardScreen() {
    Get.find<LocalStorage>().writeBoolToStorage(kStorageIsLoggedIn, true);
    Get.find<LocalStorage>().isLoggedIn.value = true;
    Get.offAllNamed(kRouteBottomNavScreen);
    Get.find<BottomNavController>().changeTabIndex(0);
    // Navigator.popAndPushNamed(Get.context!, kRouteBottomNavScreen);
    // Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (BuildContext context){
    //   return BottomNavScreen();
    // }));
  }
}
