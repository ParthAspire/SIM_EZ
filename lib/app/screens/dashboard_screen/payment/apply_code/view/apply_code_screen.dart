import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/payment/apply_code/controller/apply_code_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ApplyCodeScreen extends GetView<ApplyCodeController> {
  const ApplyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
        child: Column(
          children: [
            Text(kApplyCode, style: TextStyles.k20ColorBlackBold400),
            Padding(
              padding: const EdgeInsets.only(top: 16,bottom: 24),
              child: Text('Please enter your discount or referral code to apply.',
                  style: TextStyles.k14ColorBlackBold400Arial),
            ),
            commonTextField(
                controller: controller.codeController,
                hintText: kEnterCode,
                labelText: kEnterCode),
            primaryButton(onPress: () {}, buttonTxt: kApply.toUpperCase()),
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
      title: const Text(kApplyCode, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
