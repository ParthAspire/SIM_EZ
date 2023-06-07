import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/orders/base/controller/orders_base_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class OrdersBaseScreen extends GetView<OrdersBaseController> {
  const OrdersBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: getAppBar(),
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        itemBuilder: (context, index) {
          return Card(
            shadowColor: kColorF6F6F6,
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 6,
            child: Container(
              padding: EdgeInsets.all(6),
              color: kColorF6F6F6,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * 0.25,
                    margin: EdgeInsets.only(top: 0, right: 8),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: kColorPrimary,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kColorWhite, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text('Best 4G & LTE courage in india',
                            style: TextStyles.k6ColorWhiteBold400Arial),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(kIconCountrySymbol,
                                height: 28, width: 28),
                            SvgPicture.asset(
                              kIconSimCardCyan,
                              height: 28,
                              width: 28,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Indicomm',
                            style: TextStyles.k8ColorWhiteBold400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Get.width * 0.48,
                              child: Text('Indicomm/ Sim-ez',
                                  style: TextStyles.k18kColorBlackBold400),
                            ),
                            Text('US\$1.50',
                                style: TextStyles.k14ColorBlackBold400Arial),
                          ],
                        ),
                        SizedBox(height: 6),
                        Text('1GB - 7 Days',
                            style: TextStyles.k14ColorBlackBold400Arial),
                        SizedBox(height: 4),
                        Text('17 May 2023, 08:03',
                            style: TextStyles.k10Color989898Bold400Arial),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
      title: const Text(kOrders, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
