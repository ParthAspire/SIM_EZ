import 'package:get/get.dart';
import 'package:sim_ez/app/screens/authentication/base/controller/main_auth_controller.dart';
import 'package:sim_ez/app/screens/authentication/login/controller/login_controller.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/base/controller/my_esim_base_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainAuthController>(
      () => MainAuthController(),
      fenix: true,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
      fenix: true,
    );
    Get.lazyPut<BottomNavController>(
      () => BottomNavController(),
      fenix: true,
    );
    Get.lazyPut<MyESimBaseController>(
      () => MyESimBaseController(),
      fenix: true,
    );
  }
}
