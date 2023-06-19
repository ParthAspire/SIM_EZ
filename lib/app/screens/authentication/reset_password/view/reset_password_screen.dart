import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/authentication/reset_password/controller/reset_password_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  ResetPasswordScreen({Key? key}) : super(key: key) {
    final intentData = Get.arguments;
    controller.setIntentData(intentData: intentData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// password textfield
              Obx(
                () {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
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
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible:
                                controller.isValidPassword.value == false &&
                                    controller.passwordErrorText.value
                                        .trim()
                                        .isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 4),
                              child: Text(controller.passwordErrorText.value,
                                  style: TextStyles
                                      .k12kColorRedFF6161Bold400Arial),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 34, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonTextField(
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
                        Obx(
                          () => Visibility(
                            visible: controller.isValidConfirmPassword.value ==
                                    false &&
                                controller.confirmPasswordErrorText.value
                                    .trim()
                                    .isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 4),
                              child: Text(
                                  controller.confirmPasswordErrorText.value,
                                  style: TextStyles
                                      .k12kColorRedFF6161Bold400Arial),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: primaryButton(
                    onPress: () {
                      controller.checkUserInput();
                    },
                    buttonTxt: kRestPassword,
                    height: 40,
                    width: Get.width * .8),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: kColorECECEC,
      elevation: 0,
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.navigate_before_outlined,
              color: kColorBlack, size: 30)),
      title: const Text(kRestPassword, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
