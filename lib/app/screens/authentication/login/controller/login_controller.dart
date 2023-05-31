import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class LoginController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isShowPassword = false.obs;

  void navigateToLoginScreen() {
    Get.toNamed(kRouteBottomNavScreen);
  }
}
