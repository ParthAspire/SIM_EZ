import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/change_email/controller/change_email_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ChangeEmailScreen extends GetView<ChangeEmailController> {
  const ChangeEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(),
      body: Column(
        children: [
          SizedBox(height: 32),

          /// email-id textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: commonTextField(
              controller: controller.emailIdController,
              hintText: kHintEnterYourEmail,
              labelText: kHintEnterYourEmail,
            ),
          ),

          /// new email-id textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
            child: commonTextField(
              controller: controller.newEmailIdController,
              hintText: kHintEnterYourEmail,
              labelText: kHintEnterYourEmail,
            ),
          ),

          /// current password textfield
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: commonTextField(
                  controller: controller.currentPasswordController,
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
                  )),
            );
          }),

          Spacer(),

          /// change button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: primaryButton(
                  onPress: () {}, buttonTxt: kChange.toUpperCase(), height: 38),
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
      title: const Text(kChangeEmail, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
