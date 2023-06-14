import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class InstallationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TabController>? tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this).obs;
    super.onInit();
  }

  void navigateToGuideScreen() {
    Get.toNamed(kRouteGuideScreen);
  }
}
