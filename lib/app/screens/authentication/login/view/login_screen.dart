import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/authentication/login/controller/login_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /// email-id textfield
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonTextField(
              controller: controller.emailIdController,
              hintText: kEmailId,
              labelText: kEmailId,
              filledColor: kColorECECEC,
              isShowElevation: false,
            ),
            Obx(
                  () =>
                  Visibility(
                    visible: controller.isValidEmail.value == false &&
                        controller.emailErrorText.value
                            .trim()
                            .isNotEmpty,
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
      Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonTextField(
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
                  )),
              Obx(
                    () =>
                    Visibility(
                      visible: controller.isValidPassword.value == false &&
                          controller.passwordErrorText.value
                              .trim()
                              .isNotEmpty,
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

      /// login button
      primaryButton(
          onPress: () {
            controller.checkUserInput();
          },
          buttonTxt: kLogin,
          height: 40,
          width: Get.width * .8),

      /// 'or login with' widget
      Padding(
        padding: const EdgeInsets.only(top: 44, bottom: 26),
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
          SvgPicture.asset(kIconFB),
          SizedBox(width: 10),
          SvgPicture.asset(kIconGoogle),
        ],
      ),
    ]);
  }
}
