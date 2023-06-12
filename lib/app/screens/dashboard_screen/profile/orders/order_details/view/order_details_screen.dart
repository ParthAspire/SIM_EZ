import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/orders/order_details/controller/order_details_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class OrderDetailsScreen extends GetView<OrderDetailsController> {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(kOrderInformation, style: TextStyles.k20ColorBlackBold400),
              Card(
                shadowColor: kColorF6F6F6,
                margin: EdgeInsets.symmetric(vertical: 8),
                elevation: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  color: kColorF6F6F6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(kORDERID,
                                style: TextStyles.k12kColorBlackBold400Arial),
                            SizedBox(height: 6),
                            Text('sin.prod.ondemadactivity.com',
                                style: TextStyles.k16kColorBlackBold700Arial),
                            Container(
                              height: 1,
                              color: kColorDFDFDF,
                              margin: EdgeInsets.symmetric(vertical: 16),
                            ),
                            Text(kORDERDATE,
                                style: TextStyles.k12kColorBlackBold400Arial),
                            SizedBox(height: 6),
                            Text('17 May  2023. 08:03',
                                style: TextStyles.k16kColorBlackBold700Arial),
                            Container(
                              height: 1,
                              color: kColorDFDFDF,
                              margin: EdgeInsets.symmetric(vertical: 16),
                            ),
                            Text(kORDERSTATUS,
                                style: TextStyles.k12kColorBlackBold400Arial),
                            SizedBox(height: 6),
                            Text('Completed',
                                style: TextStyles.k16kColorBlackBold700Arial),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: primaryButton(
                      onPress: () {},
                      buttonTxt: kVIEWRECEIPT,
                      height: 36,
                      width: 210,
                      bgColor: Colors.transparent,
                      textStyle: TextStyles.k12kColorBlackBold400Arial),
                ),
              ),
              Card(
                elevation: 8,
                shadowColor: kColorBlack,
                child: Container(
                  // margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: kColor1ADDD0,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        // width: Get.width * .72,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Indicomm',
                                    style: TextStyles.k16kColorWhiteBold400),
                                Text('India',
                                    style:
                                        TextStyles.k16kColorWhiteBold400Arial),
                              ],
                            ),
                            Container(
                              width: Get.width * 0.28,
                              margin: const EdgeInsets.only(top: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: kColor005149,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: kColorWhite, width: 2),
                              ),
                              child: Column(
                                children: [
                                  const Text('Best 4G & LTE courage in india',
                                      style:
                                          TextStyles.k6ColorWhiteBold400Arial),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(kIconCountrySymbol,
                                          height: 24, width: 24),
                                      SvgPicture.asset(kIconSimCard),
                                    ],
                                  ),
                                  const Align(
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
                        height: 48,
                        // width: Get.width * .7,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                          color: kColor26E9DC,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: kColor1ADDD0,
                              blurRadius: 1.0,
                              spreadRadius: 0.5,
                              offset: Offset(0, 5),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  kIconData,
                                  height: 18,
                                ),
                                const SizedBox(width: 14),
                                const Text(kData,
                                    style:
                                        TextStyles.k12kColorWhiteBold400Arial),
                              ],
                            ),
                            const Text('1 GB',
                                style: TextStyles.k12kColorWhiteBold700Arial),
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        // width: Get.width * .72,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        margin: const EdgeInsets.only(top: 14),
                        decoration: const BoxDecoration(color: kColor26E9DC),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  kIconValidity,
                                  height: 18,
                                ),
                                const SizedBox(width: 14),
                                const Text(kValidity,
                                    style:
                                        TextStyles.k12kColorWhiteBold400Arial),
                              ],
                            ),
                            const Text('7 Days',
                                style: TextStyles.k12kColorWhiteBold700Arial),
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        // width: Get.width * .72,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        margin: const EdgeInsets.only(top: 14),
                        decoration: const BoxDecoration(color: kColor26E9DC),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  kIconBarCode,
                                  height: 18,
                                ),
                                const SizedBox(width: 14),
                                const Text(kPrice,
                                    style:
                                        TextStyles.k12kColorWhiteBold400Arial),
                              ],
                            ),
                            const Text('US \$4.50',
                                style: TextStyles.k12kColorWhiteBold700Arial),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  kPAYMENTDETAILS,
                  style: TextStyles.k20ColorBlackBold400,
                ),
              ),
              Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(kPAYMENTOFFER,
                          style: TextStyles.k16kColorBlackBold400Arial),
                      Row(
                        children: [
                          SvgPicture.asset(kIconVisa),
                          SizedBox(
                            width: 6,
                          ),
                          Text('****2022',
                              style: TextStyles.k16kColorBlackBold400Arial),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(kTOTALPRICE,
                          style: TextStyles.k16kColorBlackBold400Arial),
                      Text('US\$1.50',
                          style: TextStyles.k16kColorBlackBold400Arial),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(kREFERRALREWARD,
                          style: TextStyles.k16kColorBlackBold400Arial),
                      Text('-US\$3',
                          style: TextStyles.k16kColorRedBold400Arial),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(kFINALPRICE,
                          style: TextStyles.k16kColorBlackBold400Arial),
                      Text('US\$1.50',
                          style: TextStyles.k16kColorBlackBold400Arial),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.center,
                  child: primaryButton(
                      onPress: () {},
                      buttonTxt: kDeleteOrderDetails.toUpperCase(),
                      textStyle: TextStyles.k10ColorRedBold400,
                      height: 36,
                      width: 200,
                      bgColor: Colors.transparent,
                      borderColor: kColorRed),
                ),
              ),
            ],
          ),
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
      title: const Text(kOrderDetails, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
