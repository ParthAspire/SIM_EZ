import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/authentication/forgot_password/controller/forgot_password_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 100),
              child: SvgPicture.asset(kIconLogo),
            ),

            /// email-id textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
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

            primaryButton(
                onPress: () {
                  controller.checkUserInput();
                },
                buttonTxt: kSendOTP,
                height: 40,
                width: Get.width * .8),
          ],
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
      title:
          const Text(kForgotPassword, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
