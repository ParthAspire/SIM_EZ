import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/installation/controller/installation_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class InstallationScreen extends GetView<InstallationController> {
  const InstallationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: getAppBar(),
      body: TabBarView(
        controller: controller.tabController?.value,
        children: [
          // tab one - Direct
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kColor1ADDD0,
                          kColor005149,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(kIconCorrect),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                kYourSimEZHasBeen.toUpperCase(),
                                style: TextStyles.k12kColorWhiteBold400Arial,
                              ),
                              SizedBox(height: 4),
                              Text(
                                kSuccessfullyInstalled,
                                style: TextStyles.k20ColorWhiteBold400Arial,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 32),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kColor1ADDD0,
                          kColor005149,
                        ],
                      ),
                    ),
                    child: Text(
                      kWarningTextOne,
                      style: TextStyles.k12kColorWhiteBold400Arial,
                    ),
                  ),
                  Text(kInstallationStepOneText.toUpperCase(),
                      style: TextStyles.k20ColorBlackBold400),
                  Padding(
                    padding: EdgeInsets.only(top: 22),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      '1. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      '2. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 26),
                    child: Text(
                      '3. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Text(kInstallationStepOneText.toUpperCase(),
                      style: TextStyles.k20ColorBlackBold400),
                  Card(
                    elevation: 3.5,
                    color: kColorF6F6F6,
                    margin: EdgeInsets.only(top: 25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                          color: kColorF6F6F6,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(kIconCarrier),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kNetwork.toUpperCase(),
                                    style:
                                        TextStyles.k12kColorBlackBold400Arial,
                                  ),
                                  const Text(
                                    'Airtel',
                                    style: TextStyles.k20ColorBlackBold400Arial,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(kIconWarning),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3.5,
                    color: kColorF6F6F6,
                    margin: EdgeInsets.only(top: 25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                          color: kColorF6F6F6,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(kIconData,
                                  color: kColorBlack, height: 28, width: 28),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kAPN,
                                    style:
                                        TextStyles.k12kColorBlackBold400Arial,
                                  ),
                                  const Text(
                                    kTheAPNIsSetAutomatically,
                                    style: TextStyles.k20ColorBlackBold400Arial,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      '1. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      '2. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 40),
                    child: Text(
                      '3. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // tab two - QR Code
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kColor1ADDD0,
                          kColor005149,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(kIconCorrect),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                kYourSimEZHasBeen.toUpperCase(),
                                style: TextStyles.k12kColorWhiteBold400Arial,
                              ),
                              SizedBox(height: 4),
                              Text(
                                kSuccessfullyInstalled,
                                style: TextStyles.k20ColorWhiteBold400Arial,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 32),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kColor1ADDD0,
                          kColor005149,
                        ],
                      ),
                    ),
                    child: Text(
                      kWarningTextOne,
                      style: TextStyles.k12kColorWhiteBold400Arial,
                    ),
                  ),
                  Text(kInstallationStepOneText.toUpperCase(),
                      style: TextStyles.k20ColorBlackBold400),
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 38),
                    width: Get.width * 0.85,
                    height: Get.width * 0.85,
                    decoration: BoxDecoration(
                      color: kColorECECEC,
                    ),
                    child: Image.asset(
                      kIconQrCodePng,
                      color: kColorBlack,
                    ),
                  ),
                  Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: primaryButton(
                        onPress: () {},
                        buttonTxt: kShareQrCode.toUpperCase(),
                        textStyle: TextStyles.k12kColor1ADDD0Bold400Arial,
                        height: 32,
                        width: 200,
                        borderColor: kColor1ADDD0,
                        bgColor: Colors.transparent),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, bottom: 10),
                    child: primaryButton(
                        onPress: () {
                          controller.navigateToGuideScreen();
                        },
                        buttonTxt: kShowHowToAccessData.toUpperCase(),
                        textStyle: TextStyles.k12kColorWhiteBold400Arial,
                        height: 32,
                        width: 250),
                  ),
                ],
              ),
            ),
          ),

          // tab three - Manual
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kColor1ADDD0,
                          kColor005149,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(kIconCorrect),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                kYourSimEZHasBeen.toUpperCase(),
                                style: TextStyles.k12kColorWhiteBold400Arial,
                              ),
                              SizedBox(height: 4),
                              Text(
                                kSuccessfullyInstalled,
                                style: TextStyles.k20ColorWhiteBold400Arial,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 32),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kColor1ADDD0,
                          kColor005149,
                        ],
                      ),
                    ),
                    child: Text(
                      kWarningTextOne,
                      style: TextStyles.k12kColorWhiteBold400Arial,
                    ),
                  ),
                  Card(
                    elevation: 3.5,
                    color: kColorF6F6F6,
                    margin: EdgeInsets.only(bottom: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                          color: kColorF6F6F6,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(kSMDPADDRESS,
                                      style: TextStyles
                                          .k12kColorBlackBold400Arial),
                                  SizedBox(height: 4),
                                  const Text('sin.prod.ondemadactivity.com',
                                      style: TextStyles
                                          .k16kColorBlackBold700Arial),
                                ],
                              ),
                              SvgPicture.asset(kIconCopy, color: kColorBlack),
                            ],
                          ),
                          Container(
                            height: 1,
                            color: kColorDFDFDF,
                            margin: EdgeInsets.symmetric(vertical: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kACTIVATIONCODE,
                                    style:
                                        TextStyles.k12kColorBlackBold400Arial,
                                  ),
                                  SizedBox(height: 4),
                                  SizedBox(
                                    width: 250,
                                    child: const Text(
                                      'KDSLJGLKDJLKJRIGHJDSKVKRIOJBKHJDFLHBPODFKOIJIJ',
                                      style:
                                          TextStyles.k16kColorBlackBold700Arial,
                                    ),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(kIconCopy, color: kColorBlack),
                            ],
                          ),
                          Container(
                            height: 1,
                            color: kColorDFDFDF,
                            margin: EdgeInsets.symmetric(vertical: 16),
                          ),
                          Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is',
                              style: TextStyles.k14ColorBlackBold400Arial,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                  Text(kInstallationStepOneText.toUpperCase(),
                      style: TextStyles.k20ColorBlackBold400),
                  Padding(
                    padding: EdgeInsets.only(top: 22),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      '1. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      '2. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 26),
                    child: Text(
                      '3. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Text(kInstallationStepOneText.toUpperCase(),
                      style: TextStyles.k20ColorBlackBold400),
                  Card(
                    elevation: 3.5,
                    color: kColorF6F6F6,
                    margin: EdgeInsets.only(top: 25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                          color: kColorF6F6F6,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(kIconCarrier),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kNetwork.toUpperCase(),
                                    style:
                                        TextStyles.k12kColorBlackBold400Arial,
                                  ),
                                  const Text(
                                    'Airtel',
                                    style: TextStyles.k20ColorBlackBold400Arial,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(kIconWarning),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3.5,
                    color: kColorF6F6F6,
                    margin: EdgeInsets.only(top: 25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                          color: kColorF6F6F6,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(kIconData,
                                  color: kColorBlack, height: 28, width: 28),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kAPN,
                                    style:
                                        TextStyles.k12kColorBlackBold400Arial,
                                  ),
                                  const Text(
                                    kTheAPNIsSetAutomatically,
                                    style: TextStyles.k20ColorBlackBold400Arial,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      '1. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      '2. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 40),
                    child: Text(
                      '3. Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      style: TextStyles.k14ColorBlackBold400Arial,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
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
      title: const Text(kSimEzInstallation,
          style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          height: 50,
          color: kColorWhite,
          child: Obx(() {
            return TabBar(
              controller: controller.tabController?.value,
              indicatorColor: Colors.transparent,
              onTap: (value) {
                controller.tabController?.refresh();
              },
              tabs: [
                Text(kDirect,
                    style: controller.tabController?.value.index == 0
                        ? TextStyles.k14Color1ADDD0Bold400Arial
                        : TextStyles.k14kColor9098B1Bold400Arial),
                Text(kQRCode,
                    style: controller.tabController?.value.index == 1
                        ? TextStyles.k14Color1ADDD0Bold400Arial
                        : TextStyles.k14kColor9098B1Bold400Arial),
                Text(kManual,
                    style: controller.tabController?.value.index == 2
                        ? TextStyles.k14Color1ADDD0Bold400Arial
                        : TextStyles.k14kColor9098B1Bold400Arial),
              ],
            );
          }),
        ),
      ),
    );
  }
}
