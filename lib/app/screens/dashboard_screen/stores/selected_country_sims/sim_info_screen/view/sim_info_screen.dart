import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/sim_info_screen/controller/sim_info_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class SimInfoScreen extends GetView<SimInfoController> {
  const SimInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// country symbol & sim card name
            Container(
              margin: const EdgeInsets.only(top: 8, right: 38, left: 38),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: kColorPrimary,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kColorWhite, width: 2),
              ),
              child: Column(
                children: [
                  const Text('Best 4G & LTE courage in india',
                      style: TextStyles.k6ColorWhiteBold400Arial),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(kIconCountrySymbol, height: 90),
                      SvgPicture.asset(kIconSimCardCyan),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Indicomm',
                      style: TextStyles.k14ColorWhiteBold400,
                    ),
                  ),
                ],
              ),
            ),

            /// carrier information
            Row(
              children: [
                /// coverage stack
                Stack(
                  children: [
                    Container(
                      width: 95,
                      height: 75,
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(top: 24, left: 38, right: 12),
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: kColorBBBBDB),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(kCoverage,
                              style: TextStyles.k14kColorPrimaryBold700Arial),
                          SizedBox(height: 6),
                          Text('India',
                              style: TextStyles
                                  .k12kColorPrimaryBold400ItalicArial),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 42),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            const BoxShadow(
                              color: kColorE2E0E0,
                              blurRadius: 1.0,
                              offset: Offset(0, 5),
                            )
                          ],
                          color: kColorWhite,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            backgroundColor: kColorWhite,
                            child: SvgPicture.asset(kIconCoverage),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// data stack
                Stack(
                  children: [
                    Container(
                      width: 95,
                      height: 75,
                      margin: const EdgeInsets.only(top: 24),
                      padding: const EdgeInsets.only(bottom: 8, left: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: kColorBBBBDB),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(kData,
                              style: TextStyles.k14kColorPrimaryBold700Arial),
                          SizedBox(height: 6),
                          Text('1 GB',
                              style: TextStyles
                                  .k12kColorPrimaryBold400ItalicArial),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            const BoxShadow(
                              color: kColorE2E0E0,
                              blurRadius: 1.0,
                              offset: Offset(0, 5),
                            )
                          ],
                          color: kColorWhite,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            backgroundColor: kColorWhite,
                            child: SvgPicture.asset(kIconData,
                                color: kColor1ADDD0, height: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// validity stack
                Stack(
                  children: [
                    Container(
                      width: 95,
                      height: 75,
                      margin:
                          const EdgeInsets.only(top: 24, right: 38, left: 12),
                      padding: const EdgeInsets.only(bottom: 8, left: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: kColorBBBBDB),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(kValidity,
                              style: TextStyles.k14kColorPrimaryBold700Arial),
                          SizedBox(height: 6),
                          Text('7 Days',
                              style: TextStyles
                                  .k12kColorPrimaryBold400ItalicArial),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            const BoxShadow(
                              color: kColorE2E0E0,
                              blurRadius: 1.0,
                              offset: Offset(0, 5),
                            )
                          ],
                          color: kColorWhite,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            backgroundColor: kColorWhite,
                            child: SvgPicture.asset(kIconValidity,
                                color: kColor1ADDD0, height: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 26),
              child: Text('$kAvailablePopupPackages (4)',
                  style: TextStyles.k16kColorPrimaryBold400),
            ),

            simCartListView(),

            /// supported countries
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, right: 24, left: 24, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(kSupportedCountries,
                      style: TextStyles.k16kColorPrimaryBold400),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                        color: kColorF6F6F6,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(kImgTempFlag),
                        const Text(
                          'India',
                          style: TextStyles.k20ColorBlackBold400Arial,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Additional Information
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(kAdditionalInformation,
                      style: TextStyles.k16kColorPrimaryBold400),
                  const SizedBox(height: 20),
                  Container(
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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NETWORK',
                                  style: TextStyles.k12kColorBlackBold400Arial,
                                ),
                                Text(
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
                ],
              ),
            ),

            /// show more
            InkWell(
              onTap: () {
                controller.navigateToAdditionalInfoScreen();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 26),
                height: 36,
                width: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kColorBlack),
                ),
                alignment: Alignment.center,
                child: const Text(
                  kShowMore,
                  style: TextStyles.k12kColorBlackBold400Arial,
                ),
              ),
            ),

            /// buy now
            InkWell(
              onTap: () {
                controller.navigateToDeviceCompatibilityScreen();
              },
              child: Container(
                height: 48,
                width: Get.width,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                decoration: BoxDecoration(
                  color: kColorPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('US \$4.50 - BUY NOW',
                    style: TextStyles.k12kColorWhiteBold400Arial),
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
      title: const Text('Indicomm', style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }

  simCartListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.simController.previousPage();
                },
                child: Icon(Icons.navigate_before_outlined,
                    color: kColor1ADDD0, size: 30),
              ),
              Column(
                children: [
                  SizedBox(
                    height: Get.height * .31,
                    width: Get.width * .72,
                    child: CarouselSlider.builder(
                      itemCount: controller.tempList.length,
                      carouselController: controller.simController,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: kColor1ADDD0,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: Get.width * .72,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Indicomm',
                                            style: TextStyles
                                                .k16kColorWhiteBold400),
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
                                              SvgPicture.asset(
                                                  kIconCountrySymbol,
                                                  height: 24,
                                                  width: 24),
                                              SvgPicture.asset(kIconSimCard),
                                            ],
                                          ),
                                          const Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              'Indicomm',
                                              style: TextStyles
                                                  .k10ColorWhiteBold400,
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
                                width: Get.width * .72,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        style: TextStyles
                                            .k12kColorWhiteBold700Arial),
                                  ],
                                ),
                              ),
                              Container(
                                height: 48,
                                width: Get.width * .72,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                margin: const EdgeInsets.only(top: 14),
                                decoration:
                                    const BoxDecoration(color: kColor26E9DC),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        style: TextStyles
                                            .k12kColorWhiteBold700Arial),
                                  ],
                                ),
                              ),
                              Container(
                                height: 48,
                                width: Get.width * .72,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                margin: const EdgeInsets.only(top: 14),
                                decoration:
                                    const BoxDecoration(color: kColor26E9DC),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        style: TextStyles
                                            .k12kColorWhiteBold700Arial),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        initialPage: 0,
                        height: Get.height * .38,
                        // height: Get.height*0.2,
                        onPageChanged: (index, reason) {
                          controller.currentIndex.value = index;
                        },
                      ),
                    ),
                  )
                ],
              ),
              GestureDetector(
                  onTap: () {
                    controller.simController.nextPage();
                  },
                  child: const Icon(Icons.navigate_next_outlined,
                      color: kColor1ADDD0, size: 30)),
            ],
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.tempList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      controller.simController.animateToPage(entry.key),
                  child: Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentIndex.value == entry.key
                            ? kColor1ADDD0
                            : kColorD9D9D9),
                  ),
                );
              }).toList(),
            );
          })

          // SizedBox(
          //   height: 30,
          //   child: ListView.builder(
          //     itemCount: 10,
          //     shrinkWrap: true,
          //     padding: EdgeInsets.only(top: 10),
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return CircleAvatar(
          //         backgroundColor: kColor1ADDD0,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
