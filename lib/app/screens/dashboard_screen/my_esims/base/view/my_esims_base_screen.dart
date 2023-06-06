import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/base/controller/my_esim_base_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class MyESimBaseScreen extends GetView<MyESimBaseController> {
  const MyESimBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            appLogo(),
            currentAndArchivedSimTabBar(),
            Visibility(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 38),
                  child: Column(
                    children: [
                      SvgPicture.asset(kImgEmptyMyESim),
                      Padding(
                        padding: const EdgeInsets.only(top: 38),
                        child: Text('Lorem Ipsum is back',
                            style: TextStyles.k20ColorBlackBold400),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 80, right: 80),
                        child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            style: TextStyles.k12kColorBlackBold400Arial,
                            textAlign: TextAlign.center),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 10),
                        child: primaryButton(
                            onPress: () {
                              controller.navigateToPurchasedSimInfoScreen();
                            },
                            buttonTxt: kFindOutHow.toUpperCase(),
                            height: 38),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  appLogo() {
    return Align(
      heightFactor: 1.5,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        kIconLogo,
        height: 50,
      ),
    );
  }

  currentAndArchivedSimTabBar() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                controller.currentIndex.value = 0;
              },
              child: Container(
                height: 40,
                width: Get.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(kCurrentSimEZ,
                    style: controller.currentIndex.value == 0
                        ? TextStyles.k14Color1ADDD0Bold400Arial
                        : TextStyles.k14kColor9098B1Bold400Arial),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                controller.currentIndex.value = 1;
              },
              child: Container(
                height: 40,
                width: Get.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(kArchivedSimEZ,
                    style: controller.currentIndex.value == 1
                        ? TextStyles.k14Color1ADDD0Bold400Arial
                        : TextStyles.k14kColor9098B1Bold400Arial),
              ),
            ),
          ],
        ),
      );
    });
  }
}
