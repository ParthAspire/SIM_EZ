import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/screens/authentication/login/view/login_screen.dart';
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
      routingCallback: (value) {
        AppConstants().currentRoute = value?.current ?? '';
        debugPrint(' ############# routing callback : ${value?.current}');
      },
      home: const SplashScreen(),
      getPages: [
        GetPage(
          name: kRouteLoginScreen,
          page: () => LoginScreen(),
        ),
      ],
    );
  }
}
