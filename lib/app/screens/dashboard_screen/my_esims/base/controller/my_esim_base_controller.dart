import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class MyESimBaseController extends GetxController{
  RxString userName = 'UserName'.obs;

  RxInt currentIndex = 0.obs;

  TextEditingController searchController = TextEditingController();

  void navigateToPurchasedSimInfoScreen() {
    Get.toNamed(kRoutePurchasedSimInfoScreen);
  }
}