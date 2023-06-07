import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/more_info/base/controller/more_info_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class MoreInfoScreen extends GetView<MoreInfoController> {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Card(
        elevation: 6,
        color: kColorF8F8F8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                controller.navigateToAboutSimEzScreen();
              },
              child: ListTile(
                title: const Text(kAboutSIMEZ,
                    style: TextStyles.k16kColorBlackBold400Arial),
                trailing: InkWell(
                  onTap: () {
                    controller.navigateToAboutSimEzScreen();
                  },
                  child: const Icon(Icons.navigate_next_outlined,
                      size: 24, color: kColorBlack),
                ),
              ),
            ),
            Container(height: 0.3, color: kColorD9D9D9),
            InkWell(
              onTap: () {
                controller.navigateToPrivacyPolicyScreen();
              },
              child: ListTile(
                title: const Text(kPrivacyPolicy,
                    style: TextStyles.k16kColorBlackBold400Arial),
                trailing: InkWell(
                  onTap: () {
                    controller.navigateToPrivacyPolicyScreen();
                  },
                  child: const Icon(Icons.navigate_next_outlined,
                      size: 24, color: kColorBlack),
                ),
              ),
            ),
            Container(height: 0.3, color: kColorD9D9D9),
            InkWell(
              onTap: () {
                controller.navigateToTermsAndConditionScreen();
              },
              child: ListTile(
                title: const Text(kTermsCondition,
                    style: TextStyles.k16kColorBlackBold400Arial),
                trailing: InkWell(
                  onTap: () {
                    controller.navigateToTermsAndConditionScreen();
                  },
                  child: const Icon(Icons.navigate_next_outlined,
                      size: 24, color: kColorBlack),
                ),
              ),
            ),
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
      title: const Text(kMoreInfo, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
