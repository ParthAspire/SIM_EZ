import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/base/view/my_esims_base_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/view/profile_base_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/base/view/store_base_screen.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class BottomNavScreen extends GetView<BottomNavController> {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
            bottomNavigationBar: buildBottomNavigationMenu(context, controller),
            body: Obx(() {
              return Column(
                children: [
                  controller.isUpdate.value
                      ? SizedBox(height: 0)
                      : SizedBox(height: 0),
                  Obx(() {
                    return Expanded(
                      child: IndexedStack(
                        index: controller.tabIndex.value,
                        children: <Widget>[
                          StoreBaseScreen(),
                          MyESimBaseScreen(),
                          ProfileBaseScreen(),
                        ],
                      ),
                    );
                  }),
                ],
              );
            })
            // Column(
            //   children: <Widget>[_stackedContainers(), _navigationButtons()],
            // ),
            ),
      );
    });
  }

  Widget _stackedContainers() {
    return Obx(() {
      return Expanded(
        child: IndexedStack(
          index: controller.tabIndex.value,
          children: <Widget>[
            StoreBaseScreen(),
            MyESimBaseScreen(),
            ProfileBaseScreen(),
          ],
        ),
      );
    });
  }

  Widget _navigationButtons() {
    return Obx(() {
      return Container(
        color: kColorWhite,
        padding: EdgeInsets.symmetric(horizontal: 36),
        alignment: Alignment.center,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    kIconStore,
                    color: controller.tabIndex.value == 0
                        ? kColor1ADDD0
                        : kColorBlack,
                  ),
                  SizedBox(height: 8),
                  Text(
                    kStore,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: controller.tabIndex.value == 0
                            ? kColor1ADDD0
                            : kColorBlack),
                  ),
                ],
              ),
              onTap: () {
                controller.tabIndex.value = 0;
              },
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    kIconBottomBarSim,
                    color: controller.tabIndex.value == 1
                        ? kColor1ADDD0
                        : kColorBlack,
                  ),
                  SizedBox(height: 8),
                  Text(
                    kMyeSim,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: controller.tabIndex.value == 1
                            ? kColor1ADDD0
                            : kColorBlack),
                  ),
                ],
              ),
              onTap: () {
                controller.tabIndex.value = 1;
              },
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    kIconBottomBarProfile,
                    color: controller.tabIndex.value == 2
                        ? kColor1ADDD0
                        : kColorBlack,
                  ),
                  SizedBox(height: 8),
                  Text(
                    kProfile,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: controller.tabIndex.value == 2
                            ? kColor1ADDD0
                            : kColorBlack),
                  ),
                ],
              ),
              onTap: () {
                controller.tabIndex.value = 2;
              },
            ),
          ],
        ),
      );
    });
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 80,
          child: Column(
            children: [
              Container(
                height: 1,
                color: kColorWhite,
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                elevation: 0,
                onTap: landingPageController.changeTabIndex,
                currentIndex: landingPageController.tabIndex.value,
                // backgroundColor: Provider.of<ThemeModel>(context)
                //     .currentTheme
                //     .scaffoldBackgroundColor,
                unselectedItemColor: kColorBlack,
                selectedItemColor: kColor1ADDD0,


                unselectedLabelStyle: TextStyles.k14ColorBlackBold400Arial,
                selectedLabelStyle:  TextStyles.k14ColorWhiteBold400Arial,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(
                        kIconStore,
                        semanticsLabel: kStore,
                        color: kColor1ADDD0,
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(
                        kIconStore,
                        semanticsLabel: kStore,
                        color: kColorBlack,
                      ),
                    ),
                    label: kStore,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(
                        kIconBottomBarSim,
                        semanticsLabel: kMyeSim,
                        color: kColor1ADDD0,
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(
                        kIconBottomBarSim,
                        semanticsLabel: kMyeSim,
                        color: kColorBlack,
                      ),
                    ),
                    label: kMyeSim,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(
                        kIconBottomBarProfile,
                        semanticsLabel: kProfile,
                        color: kColor1ADDD0,
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(
                        kIconBottomBarProfile,
                        semanticsLabel: kProfile,
                        color: kColorBlack,
                      ),
                    ),
                    label: kProfile,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
