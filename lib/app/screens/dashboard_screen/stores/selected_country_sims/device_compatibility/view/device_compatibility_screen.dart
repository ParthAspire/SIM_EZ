import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/device_compatibility/controller/device_compatibility_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class DeviceCompatibilityScreen extends GetView<DeviceCompatibilityController> {
  const DeviceCompatibilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 55),
              child: SvgPicture.asset(kImgErrorDeviceCompatibility),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 24),
              child: Text(kYourDeviceDoesNotSupportSimEZ,
                  style: TextStyles.k20ColorBlackBold400,
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: const Text(kDeviceNotSupportedText,
                  style: TextStyles.k12kColorBlackBold400Arial,
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: primaryButton(
                  onPress: () {},
                  buttonTxt: kShowSupportedDevices.toUpperCase(),
                  textStyle: TextStyles.k12kColorWhiteBold400Arial,
                  height: 48),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(top: 26,bottom: 20),
                height: 36,
                width: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kColorBlack),
                ),
                alignment: Alignment.center,
                child: Text(
                  kPurchaseAnyway.toUpperCase(),
                  style: TextStyles.k12kColorBlackBold400Arial,
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
      title: const Text(kDeviceCompatibility,
          style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
