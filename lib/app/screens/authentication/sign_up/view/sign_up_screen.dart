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
        child: commonTextField(
          controller: controller.nameController,
          hintText: kHintEnterYourName,
        ),
      ),

      /// email-id textfield
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 12),
        child: commonTextField(
          controller: controller.emailIdController,
          hintText: kHintEnterYourEmail,
        ),
      ),

      /// password textfield
      Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: commonTextField(
              controller: controller.passwordController,
              hintText: kPassword,
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
              )),
        );
      }),

      /// confirm password textfield
      Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 12),
          child: commonTextField(
              controller: controller.confirmPasswordController,
              hintText: kPassword,
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
              )),
        );
      }),

      /// forgot password
      const Padding(
        padding: EdgeInsets.only(right: 34, bottom: 30),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            '$kForgotPassword ?',
            style: TextStyles.k14kColorPrimaryBold400Italic,
          ),
        ),
      ),

      /// signUp button
      primaryButton(
          onPress: () {}, buttonTxt: kSignup, height: 40, width: Get.width * .8),

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
            Text(kOrLoginWith.toUpperCase(),style: TextStyles.k10ColorBlackBold400),
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
          SvgPicture.asset(kIconFB),
          SizedBox(width: 10),
          SvgPicture.asset(kIconGoogle),
        ],
      ),

      /// terms & privacy policy text
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 30),
        child: RichText(textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(text: 'by registering, you agree to our ',style: TextStyles.k10ColorBlackBold400),
              TextSpan(text: 'terms & condition ',style: TextStyles.k10Color1ADDD0Bold400),
              TextSpan(text: 'and ',style: TextStyles.k10ColorBlackBold400),
              TextSpan(text: 'privacy policy.',style: TextStyles.k10Color1ADDD0Bold400),
            ],
          ),
        ),
      ),
    ]);
  }
}
