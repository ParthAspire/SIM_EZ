import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class StoreBaseController extends GetxController {
  RxString userName = 'UserName'.obs;
  RxInt currentIndex = 0.obs;

  TextEditingController searchController = TextEditingController();

  void navigateToSelectedCountrySimsScreen() {
    Get.toNamed(kRouteSelectedCountrySimsScreen);
  }
}
