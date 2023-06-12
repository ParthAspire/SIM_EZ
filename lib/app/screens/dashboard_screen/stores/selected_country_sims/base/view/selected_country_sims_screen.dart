import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/base/controller/selected_country_sims_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class SelectedCountrySimsScreen extends GetView<SelectedCountrySimsController> {
  const SelectedCountrySimsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if(controller.isLoggedIn.value==false){
                controller.navigateToLoginScreen();
              }else{
              controller.navigateToSimInfoScreen();}
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
                            Text('India',
                                style: TextStyles.k20ColorWhiteBold400Arial),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(kIconCountrySymbol,height: 34,width: 34),
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
                              kIconData,
                            ),
                            SizedBox(width: 14),
                            Text(kData,
                                style: TextStyles.k14ColorWhiteBold400Arial),
                          ],
                        ),
                        Text('1 GB', style: TextStyles.k14ColorWhiteBold700Arial),
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
                              kIconValidity,
                            ),
                            SizedBox(width: 14),
                            Text(kValidity,
                                style: TextStyles.k14ColorWhiteBold400Arial),
                          ],
                        ),
                        Text('7 Days',
                            style: TextStyles.k14ColorWhiteBold700Arial),
                      ],
                    ),
                  ),
                  Container(
                    height: 48,
                    width: Get.width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    decoration: BoxDecoration(
                      color: kColorPrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('US \$4.50 - BUY NOW',
                        style: TextStyles.k12kColorWhiteBold400Arial),
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
      title:
          const Text('United States', style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
