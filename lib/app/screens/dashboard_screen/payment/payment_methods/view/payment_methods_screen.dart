import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/payment/payment_methods/controller/payment_methods_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class PaymentMethodsScreen extends GetView<PaymentMethodsController> {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(kPaymentMethod, style: TextStyles.k20ColorBlackBold400),

            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 40),
              child: Text(kSelectPaymentMethodText,
                  style: TextStyles.k14ColorBlackBold400Arial),
            ),

            /// credit/debit card
            Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              color: kColorF8F8F8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(kIconCreditCard),
                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kCreditDebitCard,
                            style: TextStyles.k16kColorBlackBold400Arial),
                        Text('Visa, master card, AmEx, cup',
                            style: TextStyles.k12kColorA7A7A7Bold400Arial),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () {
                        // controller.navigateToPaymenthodsScreen();
                      },
                      child: const Icon(Icons.navigate_next_outlined,
                          size: 24, color: kColorBlack),
                    ),
                  ),
                ],
              ),
            ),

            /// paypal
            Card(
              elevation: 0,
              margin: EdgeInsets.only(top: 20),
              color: kColorF8F8F8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(kIconPaypal),
                    title: const Text(kPaypal,
                        style: TextStyles.k16kColorBlackBold400Arial),
                    trailing: primaryButton(
                        onPress: () {},
                        buttonTxt: kSelect.toUpperCase(),
                        height: 30,
                        width: 64,
                        textStyle: TextStyles.k12kColorBlackBold400Arial,
                        bgColor: Colors.transparent),
                  ),
                ],
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
      title: const Text(kPaymentMethod, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
