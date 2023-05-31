import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/controller_binding.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/screens/authentication/base/view/main_auth_screen.dart';
import 'package:sim_ez/app/screens/authentication/login/view/login_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/view/bottom_nav_screen.dart';
import 'package:sim_ez/app/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: ControllerBinding(),
      routingCallback: (value) {
        AppConstants().currentRoute = value?.current ?? '';
        debugPrint(' ############# routing callback : ${value?.current}');
      },
      home: const SplashScreen(),
      getPages: [
        GetPage(
          name: kRouteMainAuthScreen,
          page: () => MainAuthScreen(),
        ),
        GetPage(
          name: kRouteLoginScreen,
          page: () => LoginScreen(),
        ), GetPage(
          name: kRouteBottomNavScreen,
          page: () => BottomNavScreen(),
        ),
      ],
    );
  }
}
