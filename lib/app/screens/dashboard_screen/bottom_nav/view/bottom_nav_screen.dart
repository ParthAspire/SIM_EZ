import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/base/view/my_esims_base_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/view/profile_base_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/base/view/store_base_screen.dart';

class BottomNavScreen extends GetView<BottomNavController> {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[_stackedContainers(), _navigationButtons()],
      ),
    );
  }

  Widget _stackedContainers() {
    return Obx(() {
      return Expanded(
        child: IndexedStack(
          index: controller.index.value,
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
                    color: controller.index.value == 0
                        ? kColor1ADDD0
                        : kColorBlack,
                  ),
                  SizedBox(height: 8),
                  Text(
                    kStore,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: controller.index.value == 0
                            ? kColor1ADDD0
                            : kColorBlack),
                  ),
                ],
              ),
              onTap: () {
                controller.index.value = 0;
              },
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    kIconBottomBarSim,
                    color: controller.index.value == 1
                        ? kColor1ADDD0
                        : kColorBlack,
                  ),
                  SizedBox(height: 8),
                  Text(
                    kMyeSim,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: controller.index.value == 1
                            ? kColor1ADDD0
                            : kColorBlack),
                  ),
                ],
              ),
              onTap: () {
                controller.index.value = 1;
              },
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    kIconBottomBarProfile,
                    color: controller.index.value == 2
                        ? kColor1ADDD0
                        : kColorBlack,
                  ),
                  SizedBox(height: 8),
                  Text(
                    kProfile,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: controller.index.value == 2
                            ? kColor1ADDD0
                            : kColorBlack),
                  ),
                ],
              ),
              onTap: () {
                controller.index.value = 2;
              },
            ),
          ],
        ),
      );
    });
  }
}
