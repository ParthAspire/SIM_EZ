import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/purchased_sim_info/controller/purchased_sim_info_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PurchasedSimInfoScreen extends GetView<PurchasedSimInfoController> {
  const PurchasedSimInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// sim info container
              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: kColor1ADDD0,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Indicomm',
                            style: TextStyles.k20ColorWhiteBold400),

                        /// pop-up menu
                        SizedBox(
                          width: 25,
                          child: PopupMenuButton(
                            color: kColorWhite,
                            onSelected: (value) {
                              // your logic
                            },
                            itemBuilder: (BuildContext bc) {
                              return const [
                                PopupMenuItem(
                                  child: Text("Info 1"),
                                  value: '/hello',
                                ),
                                PopupMenuItem(
                                  child: Text("Info 2"),
                                  value: '/about',
                                ),
                                PopupMenuItem(
                                  child: Text("Info 3"),
                                  value: '/contact',
                                )
                              ];
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 6),
                              child: Row(
                                children: [
                                  Text(kICCIDNUMBER,
                                      style:
                                          TextStyles.k14ColorWhiteBold700Arial),
                                  SizedBox(width: 6),
                                  SvgPicture.asset(kIconCopy),
                                ],
                              ),
                            ),
                            Text('1233456678900655',
                                style: TextStyles.k12kColorWhiteBold400Arial),
                            SizedBox(height: 22),
                            Text(kCoverage,
                                style: TextStyles.k14ColorWhiteBold700Arial),
                            Text('India',
                                style: TextStyles.k12kColorWhiteBold400Arial),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 14, bottom: 24),
                      child: primaryButton(
                          onPress: () {},
                          buttonTxt: kShowMore.toUpperCase(),
                          height: 38),
                    ),
                  ],
                ),
              ),

              /// warning container
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
                child: Text(
                  kWarningTextOne,
                  style: TextStyles.k12kColorWhiteBold400Arial,
                ),
              ),

              /// sim-ez installation
              Padding(
                padding: const EdgeInsets.only(top: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(kSimEzInstallation.toUpperCase(),
                        style: TextStyles.k20ColorBlackBold400),
                    Card(
                      shadowColor: kColorEBEBEB,
                      elevation: 2,
                      margin: EdgeInsets.only(top: 20),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 10,
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SvgPicture.asset(kIconDownload),
                        ),
                        title: Text(kAccessData,
                            style: TextStyles.k14ColorBlackBold400Arial),
                        trailing: Icon(
                          Icons.navigate_next_outlined,
                          size: 30,
                          color: kColor1ADDD0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// data usage container
              Card(
                margin: EdgeInsets.only(top: 40),
                shadowColor: kColorEBEBEB,
                elevation: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(kDataUsage,
                            style: TextStyles.k14ColorBlackBold400Arial),
                        SvgPicture.asset(kIconMore),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 150,
                              child: SfRadialGauge(
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    showLabels: false,
                                    radiusFactor: 1,
                                    //Sets the minimum range for the slider.
                                    minimum: 0,

                                    //Sets the maximum range for the slider.
                                    maximum: 100,

                                    //Sets the interval range.
                                    interval: 10,

                                    //Sets the minor ticks between interval range.
                                    minorTicksPerInterval: 10,

                                    //Sets the start angle.
                                    startAngle: 250,

                                    //Sets the end angle.
                                    endAngle: 250,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 1,
                          color: kColorE2E2E2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(kUsedData,
                                style: TextStyles.k10Color1ADDD0Bold400Arial),
                            Text('1 GB',
                                style: TextStyles.k12kColorBlackBold400Arial),
                            SizedBox(height: 10),
                            Text(kTotalData,
                                style: TextStyles.k10Color1ADDD0Bold400Arial),
                            Text('3 GB',
                                style: TextStyles.k12kColorBlackBold400Arial),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// my package info
              Padding(
                padding: const EdgeInsets.only(top: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(kMyPackages.toUpperCase(),
                        style: TextStyles.k14ColorBlackBold400Arial),
                    Card(
                      shadowColor: kColorEBEBEB,
                      elevation: 2,
                      margin: const EdgeInsets.only(top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('1 GB - 7 Days',
                                style: TextStyles.k14ColorBlackBold400Arial),
                          ),
                          primaryButton(
                              onPress: () {},
                              buttonTxt: kNotActivated.toUpperCase(),
                              height: 25,
                              width: 175,
                              textStyle: TextStyles.k12kColorWhiteBold400Arial)
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// top-up packages
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kBuyTopUpPackages.toUpperCase(),
                      style: TextStyles.k20ColorBlackBold400,
                    ),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 22),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 30),
                          decoration: BoxDecoration(
                              color: kColor26E9DC,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(kIconData),
                                      SizedBox(width: 12),
                                      Text(
                                        kData,
                                        style: TextStyles
                                            .k14ColorWhiteBold400Arial,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Text('1 GB',
                                      style:
                                          TextStyles.k34ColorWhiteBold700Arial),
                                ],
                              ),
                              Column(
                                children: [
                                  primaryButton(
                                      onPress: () {},
                                      buttonTxt: 'US \$4.50',
                                      height: 26,
                                      width: 106,
                                      textStyle:
                                          TextStyles.k12kColorWhiteBold400Arial,
                                      borderColor: kColor1EB2A9,
                                      bgColor: Colors.transparent),
                                  Text('Valid for 7 days',
                                      style:
                                          TextStyles.k14ColorWhiteBold400Arial),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
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
      title: const Text('India', style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
