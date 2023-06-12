import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstallationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TabController>? tabController;

  @override
  void onInit() {
    tabController= TabController(length: 3, vsync: this).obs;
    super.onInit();
  }
}
