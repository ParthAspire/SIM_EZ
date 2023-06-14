import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/base/controller/my_esim_base_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class MyESimBaseScreen extends GetView<MyESimBaseController> {
  const MyESimBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.back();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Obx(() {
            return Column(
              children: [
                appLogo(),
                Visibility(
                    visible: controller.isLoggedIn.value,
                    child: Expanded(
                      child: Column(
                        children: [
                          currentAndArchivedSimTabBar(),
                          controller.currentIndex.value == 0
                              ? currentSimListing()
                              : archivedSimListing(),
                        ],
                      ),
                    )),
                Visibility(
                  visible: controller.isLoggedIn.value == false,
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
                            padding: const EdgeInsets.only(
                                top: 10, left: 80, right: 80),
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
                                  if (controller.isLoggedIn.value == false) {
                                    controller.navigateToLoginScreen();
                                  } else {
                                    controller.navigateToPurchasedSimInfoScreen();
                                  }
                                },
                                buttonTxt: controller.isLoggedIn.value == false
                                    ? kLogIn.toUpperCase()
                                    : kFindOutHow.toUpperCase(),
                                height: 38),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
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

  currentSimListing() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // controller.navigateToSimInfoScreen();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
              decoration: BoxDecoration(
                color: kColor1ADDD0,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Indicomm',
                                style: TextStyles.k20ColorWhiteBold400),
                            Text('12345232344567654879',
                                style: TextStyles.k14ColorWhiteBold400Arial),
                          ],
                        ),
                        Container(
                          width: Get.width * 0.34,
                          margin: EdgeInsets.only(top: 8),
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: kColor005149,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kColorWhite, width: 2),
                          ),
                          child: Column(
                            children: [
                              Text('Best 4G & LTE courage in india',
                                  style: TextStyles.k6ColorWhiteBold400Arial),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(kIconCountrySymbol,
                                      height: 34, width: 34),
                                  SvgPicture.asset(kIconSimCard),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'Indicomm',
                                  style: TextStyles.k10ColorWhiteBold400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 58,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(color: kColor26E9DC),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              kIconCoverage,
                              height: 26,
                              width: 26,
                              color: kColorWhite,
                            ),
                            SizedBox(width: 14),
                            Text(kCoverage,
                                style: TextStyles.k14ColorWhiteBold400Arial),
                          ],
                        ),
                        Text('India',
                            style: TextStyles.k14ColorWhiteBold700Arial),
                      ],
                    ),
                  ),
                  Container(
                    height: 58,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.only(top: 14),
                    decoration: BoxDecoration(color: kColor26E9DC),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              kIconData,
                            ),
                            SizedBox(width: 14),
                            Text(kRemainningData,
                                style: TextStyles.k14ColorWhiteBold400Arial),
                          ],
                        ),
                        Text('1 GB',
                            style: TextStyles.k14ColorWhiteBold700Arial),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        primaryButton(
                            onPress: () {},
                            buttonTxt: kTopUp,
                            height: 38,
                            width: Get.width * .34),
                        primaryButton(
                            onPress: () {
                              controller.navigateToPurchasedSimInfoScreen();
                            },
                            buttonTxt: kDetails,
                            height: 38,
                            width: Get.width * .34),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  archivedSimListing() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // controller.navigateToSimInfoScreen();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
              decoration: BoxDecoration(
                color: kColor1ADDD0,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Indicomm',
                                style: TextStyles.k20ColorWhiteBold400),
                            Text('12345232344567654879',
                                style: TextStyles.k14ColorWhiteBold400Arial),
                          ],
                        ),
                        Container(
                          width: Get.width * 0.34,
                          margin: EdgeInsets.only(top: 8),
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: kColor005149,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kColorWhite, width: 2),
                          ),
                          child: Column(
                            children: [
                              Text('Best 4G & LTE courage in india',
                                  style: TextStyles.k6ColorWhiteBold400Arial),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(kIconCountrySymbol,
                                      height: 34, width: 34),
                                  SvgPicture.asset(kIconSimCard),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'Indicomm',
                                  style: TextStyles.k10ColorWhiteBold400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 58,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(color: kColor26E9DC),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              kIconCoverage,
                              height: 26,
                              width: 26,
                              color: kColorWhite,
                            ),
                            SizedBox(width: 14),
                            Text(kCoverage,
                                style: TextStyles.k14ColorWhiteBold400Arial),
                          ],
                        ),
                        Text('India',
                            style: TextStyles.k14ColorWhiteBold700Arial),
                      ],
                    ),
                  ),
                  Container(
                    height: 58,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.only(top: 14),
                    decoration: BoxDecoration(color: kColor26E9DC),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              kIconData,
                            ),
                            SizedBox(width: 14),
                            Text(kRemainningData,
                                style: TextStyles.k14ColorWhiteBold400Arial),
                          ],
                        ),
                        Text('1 GB',
                            style: TextStyles.k14ColorWhiteBold700Arial),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        primaryButton(
                            onPress: () {},
                            buttonTxt: kTopUp,
                            height: 38,
                            width: Get.width * .34),
                        primaryButton(
                            onPress: () {
                              controller.navigateToPurchasedSimInfoScreen();
                            },
                            buttonTxt: kDetails,
                            height: 38,
                            width: Get.width * .34),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
