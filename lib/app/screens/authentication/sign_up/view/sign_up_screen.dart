import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /// name textfield
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Focus(
              onFocusChange: (value) {
                if (value == false) {
                  controller.userNameValidation();
                }
              },
              child: commonTextField(
                controller: controller.nameController,
                hintText: kHintEnterYourName,
                labelText: kHintEnterYourName,
                filledColor: kColorECECEC,
                isShowElevation: false,
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.isValidName.value == false &&
                    controller.nameErrorText.value.trim().isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4),
                  child: Text(controller.nameErrorText.value,
                      style: TextStyles.k12kColorRedFF6161Bold400Arial),
                ),
              ),
            ),
          ],
        ),
      ),

      /// email-id textfield
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Focus(
              onFocusChange: (value) {
                if (value == false) {
                  controller.emailValidation();
                }
              },
              child: commonTextField(
                controller: controller.emailIdController,
                hintText: kHintEnterYourEmail,
                labelText: kHintEnterYourEmail,
                filledColor: kColorECECEC,
                isShowElevation: false,
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.isValidEmail.value == false &&
                    controller.emailErrorText.value.trim().isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4),
                  child: Text(controller.emailErrorText.value,
                      style: TextStyles.k12kColorRedFF6161Bold400Arial),
                ),
              ),
            ),
          ],
        ),
      ),

      /// password textfield
      Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Focus(
                  onFocusChange: (value) {
                    if (value == false) {
                      controller.passwordValidation();
                    }
                  },
                  child: commonTextField(
                    controller: controller.passwordController,
                    hintText: kPassword,
                    labelText: kPassword,
                    filledColor: kColorECECEC,
                    isShowElevation: false,
                    obscure: !controller.isShowPassword.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowPassword.value =
                            !controller.isShowPassword.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: controller.isShowPassword.value
                            ? Icon(Icons.remove_red_eye)
                            : SvgPicture.asset(kIconPasswordOff),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.isValidPassword.value == false &&
                        controller.passwordErrorText.value.trim().isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 4),
                      child: Text(controller.passwordErrorText.value,
                          style: TextStyles.k12kColorRedFF6161Bold400Arial),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      /// confirm password textfield
      Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Focus(
                  onFocusChange: (value) {
                    if (value == false) {
                      controller.confirmPasswordValidation(isFocus: true);
                    }
                  },
                  child: commonTextField(
                    controller: controller.confirmPasswordController,
                    hintText: kConfirmPassword,
                    labelText: kConfirmPassword,
                    filledColor: kColorECECEC,
                    isShowElevation: false,
                    obscure: !controller.isShowConfirmPassword.value,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowConfirmPassword.value =
                            !controller.isShowConfirmPassword.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: controller.isShowConfirmPassword.value
                            ? Icon(Icons.remove_red_eye)
                            : SvgPicture.asset(kIconPasswordOff),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.isValidConfirmPassword.value == false &&
                        controller.confirmPasswordErrorText.value
                            .trim()
                            .isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 4),
                      child: Text(controller.confirmPasswordErrorText.value,
                          style: TextStyles.k12kColorRedFF6161Bold400Arial),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      /// forgot password
      GestureDetector(
        onTap: () {
          controller.navigateToForgotPasswordScreen();
        },
        child: const Padding(
          padding: EdgeInsets.only(right: 34, bottom: 30),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              '$kForgotPassword ?',
              style: TextStyles.k14kColorPrimaryBold400Italic,
            ),
          ),
        ),
      ),

      /// signUp button
      primaryButton(
          onPress: () {
            controller.checkUserInput();
          },
          buttonTxt: kSignup,
          height: 40,
          width: Get.width * .8),

      /// 'or login with' widget
      Padding(
        padding: const EdgeInsets.only(top: 22, bottom: 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * .32,
              height: 0.8,
              color: kColorCBCBCB,
            ),
            Text(kOrLoginWith.toUpperCase(),
                style: TextStyles.k10ColorBlackBold400),
            Container(
              width: Get.width * .3,
              height: 0.8,
              color: kColorCBCBCB,
            ),
          ],
        ),
      ),

      /// fb and google login
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(kIconFB, height: 35),
          SizedBox(width: 14),
          GestureDetector(
              onTap: () {
                controller.gmailLogin();
              },
              child: SvgPicture.asset(kIconGoogle, height: 35)),
        ],
      ),

      /// terms & privacy policy text
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 30),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'by registering, you agree to our ',
                  style: TextStyles.k10ColorBlackBold400),
              TextSpan(
                  text: 'terms & condition ',
                  style: TextStyles.k10Color1ADDD0Bold400),
              TextSpan(text: 'and ', style: TextStyles.k10ColorBlackBold400),
              TextSpan(
                  text: 'privacy policy.',
                  style: TextStyles.k10Color1ADDD0Bold400),
            ],
          ),
        ),
      ),
    ]);
  }
}
