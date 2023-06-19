import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/change_password/controller/change_password_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(),
      body: Column(
        children: [
          SizedBox(height: 32),

          /// current password textfield
          Obx(
            () {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonTextField(
                      controller: controller.oldPasswordController,
                      hintText: kCurrentPassword,
                      labelText: kCurrentPassword,
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
                        visible: controller.isValidOldPassword.value == false &&
                            controller.oldPasswordErrorText.value
                                .trim()
                                .isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 4),
                          child: Text(controller.oldPasswordErrorText.value,
                              style: TextStyles.k12kColorRedFF6161Bold400Arial),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          /// new password textfield
          Obx(
            () {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonTextField(
                      controller: controller.retypePasswordController,
                      hintText: kNewPassword,
                      labelText: kNewPassword,
                      obscure: !controller.isShowNewPassword.value,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.isShowNewPassword.value =
                              !controller.isShowNewPassword.value;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: controller.isShowNewPassword.value
                              ? Icon(Icons.remove_red_eye)
                              : SvgPicture.asset(kIconPasswordOff),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.isValidPassword.value == false &&
                            controller.newPasswordErrorText.value
                                .trim()
                                .isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 4),
                          child: Text(controller.newPasswordErrorText.value,
                              style: TextStyles.k12kColorRedFF6161Bold400Arial),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          /// retype password textfield
          Obx(
            () {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonTextField(
                      controller: controller.newPasswordController,
                      hintText: kRetypePassword,
                      labelText: kRetypePassword,
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
                        visible:
                            controller.isValidConfirmPassword.value == false &&
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

          Spacer(),

          /// change button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: primaryButton(
                  onPress: () {
                    controller.checkUserInput();
                  },
                  buttonTxt: kChange.toUpperCase(),
                  height: 38),
            ),
          ),
        ],
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
      title:
          const Text(kChangePassword, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
