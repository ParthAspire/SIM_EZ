import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/additional_info/base/controller/additional_info_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class AdditionalInfoScreen extends GetView<AdditionalInfoController> {
  const AdditionalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 24, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                  style: TextStyles.k12kColorBlackBold400Arial,
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
                            SvgPicture.asset(kIconData, color: kColorBlack),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kPlanType.toUpperCase(),
                                  style: TextStyles.k12kColorBlackBold400Arial,
                                ),
                                const Text(
                                  'Data Only',
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
                            SvgPicture.asset(kIconActivity, color: kColorBlack),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kActivationPolicy.toUpperCase(),
                                  style: TextStyles.k12kColorBlackBold400Arial,
                                ),
                                SizedBox(
                                  width: Get.width * 0.64,
                                  child: const Text(
                                    'the validation period start when the Sim-EZ Connect to any supported networks.',
                                    style:
                                        TextStyles.k16kColorBlackBold400Arial,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
      title: const Text(kAdditionalInformation,
          style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
