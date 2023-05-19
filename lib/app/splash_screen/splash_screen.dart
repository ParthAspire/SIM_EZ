import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/utils/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocalStorage localStorage = Get.put(LocalStorage());

  bool isLoggedIn = false;

  Future<void> checkUserIsLoggedIn() async {
    isLoggedIn = await localStorage.getBoolFromStorage(kStorageIsLoggedIn);

    if (isLoggedIn) {
      // navigate to dashboard screen
    } else {
      Get.offAllNamed(kRouteLoginScreen);
      // navigate to login screen
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        checkUserIsLoggedIn();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
          color: kColorWhite,
        ),
        child: Image.asset(kGifSplashScreen),
      ),
    );
  }
}
