import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/create_password/controller/create_password_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class CreatePasswordScreen extends GetView<CreatePasswordController> {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.stepIndex.value == 2) {
          controller.stepIndex.value = 1;
        } else {
          Get.back();
        }
        return false;
      },
      child: Obx(
        () {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: getAppBar(),
            body: controller.stepIndex.value == 1
                ? stepFirstWidget()
                : stepTwoWidget(),
          );
        },
      ),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: kColorECECEC,
      elevation: 0,
      leading: InkWell(
          onTap: () {
            if (controller.stepIndex.value == 2) {
              controller.stepIndex.value = 1;
            } else {
              Get.back();
            }
          },
          child: const Icon(Icons.navigate_before_outlined,
              color: kColorBlack, size: 30)),
      title:
          const Text(kCreatePassword, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }

  stepFirstWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
      child: Column(
        children: [
          Text(
            kStepFirstText,
            style: TextStyles.k20ColorBlackBold400,
          ),
          SizedBox(height: 18),
          Text(
            kStepFirstSubText,
            style: TextStyles.k14ColorBlackBold400Arial,
          ),

          /// new password textfield
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: commonTextField(
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
                  )),
            );
          }),

          /// retype password textfield
          Obx(() {
            return commonTextField(
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
                ));
          }),

          Spacer(),

          /// create button
          primaryButton(
              onPress: () {
                controller.stepIndex.value = 2;
              },
              buttonTxt: kCreate,
              height: 38),
        ],
      ),
    );
  }

  stepTwoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
      child: Column(
        children: [
          Text(
            kStepSecondText,
            style: TextStyles.k20ColorBlackBold400,
          ),
          SizedBox(height: 18),
          Text(
            kStepSecondSubText,
            style: TextStyles.k14ColorBlackBold400Arial,
          ),

          /// email-id textfield
          commonTextField(
            controller: controller.emailIdController,
            hintText: kEmailId,
            labelText: kEmailId,
          ),

          /// new password textfield
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: commonTextField(
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
                  )),
            );
          }),

          /// retype password textfield
          Obx(() {
            return commonTextField(
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
                ));
          }),

          Spacer(),

          /// create button
          primaryButton(
              onPress: () {
                if (controller.stepIndex.value == 1) {
                  controller.stepIndex.value = 2;
                } else {
                  Get.back();
                }
              },
              buttonTxt: kCreate,
              height: 38),
        ],
      ),
    );
  }
}
