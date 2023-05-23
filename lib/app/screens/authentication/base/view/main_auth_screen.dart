import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/authentication/base/controller/main_auth_controller.dart';
import 'package:sim_ez/app/screens/authentication/login/view/login_screen.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/view/sign_up_screen.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class MainAuthScreen extends GetView<MainAuthController> {
  const MainAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SvgPicture.asset(kIconLogo),
              ),
              loginAndSignUpTab(),
              Container(margin: EdgeInsets.symmetric(vertical: 26),height: 1, color: kColorE2E0E0),
              Obx(() {
                return controller.currentIndex.value == 0
                    ? LoginScreen()
                    : SignUpScreen();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginAndSignUpTab() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                controller.currentIndex.value = 0;
              },
              child: Container(
                height: 40,
                width: Get.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: controller.currentIndex.value == 0
                      ? kColor1ADDD0
                      : kColorWhite,
                ),
                child: Text(kLogin,
                    style: controller.currentIndex.value == 0
                        ? TextStyles.k14ColorWhiteBold400
                        : TextStyles.k14Color1ADDD0Bold400),
              ),
            ),
            InkWell(
              onTap: () {
                controller.currentIndex.value = 1;
              },
              child: Container(
                height: 40,
                width: Get.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: controller.currentIndex.value == 1
                      ? kColor1ADDD0
                      : kColorWhite,
                ),
                child: Text(kSignup,
                    style: controller.currentIndex.value == 1
                        ? TextStyles.k14ColorWhiteBold400
                        : TextStyles.k14Color1ADDD0Bold400),
              ),
            ),
          ],
        ),
      );
    });
  }
}
