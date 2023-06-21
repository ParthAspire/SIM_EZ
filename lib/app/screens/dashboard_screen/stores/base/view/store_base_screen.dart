import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/base/controller/store_base_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class StoreBaseScreen extends GetView<StoreBaseController> {
  const StoreBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appLogo(),
              welcomeText(),
              searchTextField(),
              localAndGlobalSimTabBar(),
              Obx(() {
                return Visibility(
                  visible: controller.currentIndex.value == 0,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
                    child: Text(
                      kPopularCountries,
                      style: TextStyles.k20ColorBlackBold400,
                    ),
                  ),
                );
              }),
              Obx(() {
                return controller.currentIndex.value == 0
                    ? countryListing()
                    : globalSimsList();
              }),
            ],
          ),
          // floatingActionButton: Obx(() {
          //   return Visibility(
          //     visible: controller.isShowFab.value &&
          //         controller.currentIndex.value == 1,
          //     child: Container(
          //       height: 38,
          //       width: 38,
          //       margin: EdgeInsets.symmetric(horizontal: 14),
          //       decoration: BoxDecoration(
          //         color: Colors.deepOrange,
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //       child: FloatingActionButton(
          //         isExtended: controller.isShowFab.value,
          //         backgroundColor: Colors.transparent,
          //         elevation: 0,
          //         onPressed: () {},
          //         child: Icon(
          //           Icons.message,
          //           color: kColorWhite,
          //           size: 20,
          //         ),
          //       ),
          //     ),
          //   );
          // }),
        ),
      );

  }

  appLogo() {
    return Align(
      heightFactor: 1.5,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        kIconLogo,
        height: 50,
      ),
    );
  }

  welcomeText() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
        child: Text('$kHello, ${controller.userName.value}',
            style: TextStyles.k20ColorBlackBold400),
      );
    });
  }

  searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: commonTextField(
        controller: controller.searchController,
        hintText: kMyESimSearchText,
        labelText: kMyESimSearchText,
        hintTextStyle: TextStyles.k12kColor9098B1Bold400Arial,
        preFixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(kIconSearch),
        ),
      ),
    );
  }

  localAndGlobalSimTabBar() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                controller.currentIndex.value=0;
              },
              child: Container(
                height: 40,
                width: Get.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(kLocalESim,
                    style: controller.currentIndex.value == 0
                        ? TextStyles.k14Color1ADDD0Bold400Arial
                        : TextStyles.k14kColor9098B1Bold400Arial),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                controller.currentIndex.value = 1;
              },
              child: Container(
                height: 40,
                width: Get.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(kGlobalESims,
                    style: controller.currentIndex.value == 1
                        ? TextStyles.k14Color1ADDD0Bold400Arial
                        : TextStyles.k14kColor9098B1Bold400Arial),
              ),
            ),
          ],
        ),
      );
    });
  }

  countryListing() {
    return Expanded(
      child: ListView.builder(
        itemCount: 14,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              controller.navigateToSelectedCountrySimsScreen();
            },
            contentPadding:
            EdgeInsets.only(left: 32, right: 16, top: 0, bottom: 0),
            leading: SvgPicture.asset(kImgTempFlag),
            title: Text('United States'),
            trailing: Icon(Icons.navigate_next_outlined, color: kColor1ADDD0),
          );
        },
      ),
    );
  }

  globalSimsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        controller: controller.globalSimListController,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (controller.isLoggedIn == false) {
                    controller.navigateToLoginScreen();
                  } else {
                    controller.navigateToSimInfoScreen();
                  }
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
                                    style:
                                    TextStyles.k20ColorWhiteBold400Arial),
                              ],
                            ),
                            Container(
                              width: Get.width * 0.34,
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: kColor005149,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                Border.all(color: kColorWhite, width: 2),
                              ),
                              child: Column(
                                children: [
                                  Text('Best 4G & LTE courage in india',
                                      style:
                                      TextStyles.k6ColorWhiteBold400Arial),
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
                                    style:
                                    TextStyles.k14ColorWhiteBold400Arial),
                              ],
                            ),
                            Text('1 GB',
                                style: TextStyles.k14ColorWhiteBold700Arial),
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
                                    style:
                                    TextStyles.k14ColorWhiteBold400Arial),
                              ],
                            ),
                            Text('7 Days',
                                style: TextStyles.k14ColorWhiteBold700Arial),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.isLoggedIn == false) {
                            controller.navigateToLoginScreen();
                          } else {
                            controller.navigateToSecureCheckoutScreen();
                          }
                        },
                        child: Container(
                          height: 48,
                          width: Get.width,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 18),
                          decoration: BoxDecoration(
                            color: kColorPrimary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text('US \$4.50 - BUY NOW',
                              style: TextStyles.k12kColorWhiteBold400Arial),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Obx(() {
              //   return Visibility(
              //       visible: controller.isShowLoader.value,
              //       child: Container(
              //         height: Get.height*0.9,
              //         child: SpinKitFadingCircle(
              //           color: kColorPrimary,
              //         ),
              //       ));
              // }),
            ],
          );
        },
      ),
    );
  }
}
