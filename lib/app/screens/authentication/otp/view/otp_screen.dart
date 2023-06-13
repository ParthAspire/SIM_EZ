import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/authentication/otp/controller/otp_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class OtpScreen extends GetView<OtpController> {
  OtpScreen({Key? key}) : super(key: key) {
    final intentData = Get.arguments;
    controller.setIntentData(intentData: intentData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SvgPicture.asset(kIconLogo),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'OTP has been sent to : ',
                      style: TextStyles.k18kColorBlackBold400),
                  TextSpan(
                      text: controller.emailId.value,
                      style: TextStyles.k18kColorBlackBold700),
                ],
              ),
            ),
          ),
          otpTextFields(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: primaryButton(
                onPress: () {
                  controller.checkUserInput();
                },
                buttonTxt: kVerifyOTP,
                height: 38,
                width: Get.width * .8),
          ),
        ],
      ),
    );
  }

  Widget otpTextFields() {
    return Padding(
      padding: const EdgeInsets.only(left: 34, right: 34, top: 58),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(kEnterCode.toUpperCase(),
                    style: TextStyles.k16kColorBlackBold400Arial),
              )),
          PinCodeTextField(
            appContext: Get.context!,
            controller: controller.otpController,
            length: 4,
            autoDismissKeyboard: true,
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (String value) {},
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 46,
              fieldWidth: 40,
              activeFillColor: kColorWhite,
              inactiveFillColor: kColorWhite,
              inactiveColor: kColorBlack,
              disabledColor: Colors.black,
              activeColor: kColorPrimary,
              selectedFillColor: kColorPrimary,
              selectedColor: kColorPrimary,
            ),
            cursorColor: Colors.black,
            onCompleted: (v) {
              // controller.isOtpEntered.value = true;
              // controller.otpText.value = v;
            },
            validator: (v) {
              if (v!.length < 3) {
                return "";
              } else {
                return null;
              }
            },
          ),
          Obx(
                () =>
                Visibility(
                  visible: controller.isOtpEntered.value == false &&
                      controller.otpErrorText.value
                          .trim()
                          .isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, top: 0),
                    child: Text(controller.otpErrorText.value,
                        style: TextStyles.k12kColorRedFF6161Bold400Arial),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
