import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class AccountInfoBaseController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();

  RxBool isReceiveEmail = true.obs;

  void navigateToChangePasswordScreen() {
    Get.toNamed(kRouteChangePasswordScreen);
  }

  void navigateToChangeEmailScreen() {
    Get.toNamed(kRouteChangeEmailScreen);
  }
}
