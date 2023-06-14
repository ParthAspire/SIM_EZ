import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/step_by_step_guide/controller/guide_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class GuideScreen extends GetView<GuideController> {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: IntroductionScreen(
        showNextButton: false,
        showDoneButton: false,
        done: const Text("Done"),
        controlsPadding: EdgeInsets.only(bottom: 200),
        bodyPadding: EdgeInsets.zero,
        isBottomSafeArea: false,
        onDone: () {
          // On button pressed
        },
        pages: [
          PageViewModel(
            title: kSelectSupportedNetwork,
            body:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: Image.asset(kImgDummyPhonePng),
            decoration: const PageDecoration(
                titleTextStyle: TextStyles.k20ColorBlackBold400,
                bodyTextStyle: TextStyles.k14ColorBlackBold400Arial,
                safeArea: 0,
                imagePadding: EdgeInsets.zero),
          ),
          PageViewModel(
            title: kTurnOnDataRoaming,
            body:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: Image.asset(kImgDummyPhonePng),
            decoration: const PageDecoration(
              titleTextStyle: TextStyles.k20ColorBlackBold400,
              bodyTextStyle: TextStyles.k14ColorBlackBold400Arial,
              safeArea: 0,imagePadding: EdgeInsets.zero
            ),
          ),
          PageViewModel(
            title: kTurnOnYourSimEZ,
            body:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: Image.asset(kImgDummyPhonePng),
            decoration: const PageDecoration(
              titleTextStyle: TextStyles.k20ColorBlackBold400,
              bodyTextStyle: TextStyles.k14ColorBlackBold400Arial,
              safeArea: 0,imagePadding: EdgeInsets.zero
            ),
          ),
          PageViewModel(
            title: kCongratulations,
            body:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: Image.asset(kImgDummyPhonePng),
            decoration: const PageDecoration(
              titleTextStyle: TextStyles.k20ColorBlackBold400,
              bodyTextStyle: TextStyles.k14ColorBlackBold400Arial,
              safeArea: 0,imagePadding: EdgeInsets.zero
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
          const Text(kStepByStepGuide, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
