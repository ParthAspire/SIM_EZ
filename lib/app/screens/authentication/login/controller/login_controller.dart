import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/view/bottom_nav_screen.dart';
import 'package:sim_ez/app/utils/local_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isShowPassword = false.obs;

  void navigateToLoginScreen() {
    Get.find<LocalStorage>().writeBoolToStorage(kStorageIsLoggedIn, true);
    Get.find<LocalStorage>().isLoggedIn.value = true;
    Navigator.popAndPushNamed(Get.context!, kRouteBottomNavScreen);
    // Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (BuildContext context){
    //   return BottomNavScreen();
    // }));
  }
}
