import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/payment/secure_checkout/controller/secure_checkout_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class SecureCheckoutScreen extends GetView<SecureCheckOutController> {
  const SecureCheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              child: Column(
                children: [
                  /// card info
                  Card(
                    elevation: 8,
                    shadowColor: kColorBlack,
                    margin: EdgeInsets.zero,
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
                                        style:
                                            TextStyles.k16kColorWhiteBold400),
                                    Text('India',
                                        style: TextStyles
                                            .k16kColorWhiteBold400Arial),
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
                                    border: Border.all(
                                        color: kColorWhite, width: 2),
                                  ),
                                  child: Column(
                                    children: [
                                      const Text(
                                          'Best 4G & LTE courage in india',
                                          style: TextStyles
                                              .k6ColorWhiteBold400Arial),
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
                                          style:
                                              TextStyles.k10ColorWhiteBold400,
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
                                        style: TextStyles
                                            .k12kColorWhiteBold400Arial),
                                  ],
                                ),
                                const Text('1 GB',
                                    style:
                                        TextStyles.k12kColorWhiteBold700Arial),
                              ],
                            ),
                          ),
                          Container(
                            height: 48,
                            // width: Get.width * .72,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            margin: const EdgeInsets.only(top: 14),
                            decoration:
                                const BoxDecoration(color: kColor26E9DC),
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
                                        style: TextStyles
                                            .k12kColorWhiteBold400Arial),
                                  ],
                                ),
                                const Text('7 Days',
                                    style:
                                        TextStyles.k12kColorWhiteBold700Arial),
                              ],
                            ),
                          ),
                          Container(
                            height: 48,
                            // width: Get.width * .72,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            margin: const EdgeInsets.only(top: 14),
                            decoration:
                                const BoxDecoration(color: kColor26E9DC),
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
                                        style: TextStyles
                                            .k12kColorWhiteBold400Arial),
                                  ],
                                ),
                                const Text('US \$4.50',
                                    style:
                                        TextStyles.k12kColorWhiteBold700Arial),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// choose payment method
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kChoosePaymentMethod,
                            style: TextStyles.k20ColorBlackBold400),
                        Padding(
                          padding: const EdgeInsets.only(top: 18, bottom: 24),
                          child: Text(kPaymentTextOne,
                              style: TextStyles.k14ColorBlackBold400Arial),
                        ),
                        Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          color: kColorF8F8F8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text(kChoosePaymentMethod,
                                    style:
                                        TextStyles.k16kColorBlackBold400Arial),
                                trailing: InkWell(
                                  onTap: () {
                                    controller.navigateToPaymenthodsScreen();
                                  },
                                  child: const Icon(
                                      Icons.navigate_next_outlined,
                                      size: 24,
                                      color: kColorBlack),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // apply code
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(kApplyCode, style: TextStyles.k20ColorBlackBold400),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 24),
                        child: Text(kPaymentTextTwo,
                            style: TextStyles.k14ColorBlackBold400Arial),
                      ),
                      Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        color: kColorF8F8F8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text(kApplyCode,
                                  style: TextStyles.k16kColorBlackBold400Arial),
                              trailing: InkWell(
                                onTap: () {
                                  controller.navigateToApplyCodeScreen();
                                },
                                child: const Icon(Icons.navigate_next_outlined,
                                    size: 24, color: kColorBlack),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // check boxes
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () {
                                return Checkbox(
                                  value: controller.checkBoxFirst.value,
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -4),
                                  activeColor: kColor1ADDD0,
                                  checkColor: kColorBlack,
                                  onChanged: (value) {
                                    controller.checkBoxFirst.value =
                                        value ?? false;
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: SizedBox(
                                width: Get.width * .7,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text:
                                              'By completing the order, you agree to our ',
                                          style: TextStyles
                                              .k14ColorBlackBold400Arial),
                                      TextSpan(
                                          text: 'Team and condition ',
                                          style: TextStyles
                                              .k14ColorBlackBold700Arial),
                                      TextSpan(
                                          text: 'and ',
                                          style: TextStyles
                                              .k14ColorBlackBold400Arial),
                                      TextSpan(
                                          text: 'privacy policy ',
                                          style: TextStyles
                                              .k14ColorBlackBold700Arial),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () {
                                  return Checkbox(
                                    value: controller.checkBoxSecond.value,
                                    visualDensity: VisualDensity(
                                        horizontal: -4, vertical: -4),
                                    activeColor: kColor1ADDD0,
                                    checkColor: kColorBlack,
                                    onChanged: (value) {
                                      controller.checkBoxSecond.value =
                                          value ?? false;
                                    },
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: SizedBox(
                                  width: Get.width * .7,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text:
                                                'before completing this order,  please confirm your device is sim-EZ Compatible and   ',
                                            style: TextStyles
                                                .k14ColorBlackBold400Arial),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // order container
            Container(
              decoration: BoxDecoration(color: kColorEBEBEB),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(kAmountToBePaid,
                          style: TextStyles.k14ColorBlackBold400Arial),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            Text('US\$4.50 ',
                                style: TextStyles.k20ColorBlackBold400Arial),
                            GestureDetector(
                              onTap: () {
                                openOrderSummaryBottomSheet();
                              },
                              child: Icon(
                                Icons.navigate_next_outlined,
                                color: kColorBlack,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  primaryButton(
                      onPress: () {},
                      buttonTxt: kCompleteOrder.toUpperCase(),
                      height: 30,
                      width: 150,
                      textStyle: TextStyles.k12kColorBlackBold400Arial,
                      bgColor: Colors.transparent),
                ],
              ),
            )
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
      title:
          const Text(kSecureCheckout, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }

  openOrderSummaryBottomSheet() {
    Get.bottomSheet(
      backgroundColor: kColorEBEBEB,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                kOrderSummary,
                style: TextStyles.k20ColorBlackBold400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 26,right: 26),
              child: Text(
                kOrderSummaryTextOne,
                style: TextStyles.k14ColorBlackBold400Arial,
              ),
            ),
            Container(
              height: 1,
              color: kColorD9D9D9,
              margin: EdgeInsets.symmetric(vertical: 14),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(kTotalPrice, style: TextStyles.k16kColorBlackBold400Arial),
                  Text('us\$4.50', style: TextStyles.k16kColorBlackBold700Arial),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
