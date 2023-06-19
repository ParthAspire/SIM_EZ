import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/auth_repo.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/model/request/send_otp_request_model.dart';
import 'package:sim_ez/app/utils/alert_message_utils.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/regex_data.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailIdController = TextEditingController();

  RxBool isValidEmail = true.obs;
  RxString emailErrorText = ''.obs;

  @override
  void onInit() {
    Get.lazyPut(() => AuthRepo(), fenix: true);
    super.onInit();
  }

  void checkUserInput() {
    if (emailIdController.text.trim().isNotEmpty && isValidEmail.value) {
      forgotPasswordApiCall();
    } else {
      emailValidation();
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

  forgotPasswordApiCall() async {
    try {
      var requestModel = SendOtpRequestModel(
        email: emailIdController.text.trim(),
      );
      var response = await Get.find<AuthRepo>()
          .forgotPasswordApiCall(requestModel: requestModel);

      if (response == true) {
        Get.find<AlertMessageUtils>().showToastMessages(
            msg: 'OTP send Successfully',
            textStyle: TextStyles.k16kColorGreenBold700Arial);
        navigateToOtpScreen();
      }
    } catch (e) {
      LoggerUtils.logException('forgotPasswordApiCall', e);
    }
  }

  void navigateToOtpScreen() {
    Get.toNamed(
      kRouteOtpScreen,
      arguments: [null, emailIdController.text.trim(), null, true],
    );
  }
}
