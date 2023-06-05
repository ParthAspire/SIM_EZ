import 'package:get/get.dart';
import 'package:sim_ez/app/screens/authentication/base/controller/main_auth_controller.dart';
import 'package:sim_ez/app/screens/authentication/login/controller/login_controller.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/base/controller/my_esim_base_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/controller/profile_base_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/base/controller/store_base_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/base/controller/selected_country_sims_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/device_compatibility/controller/device_compatibility_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/sim_info_screen/controller/sim_info_controller.dart';

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
    Get.lazyPut<StoreBaseController>(
      () => StoreBaseController(),
      fenix: true,
    );
    Get.lazyPut<MyESimBaseController>(
      () => MyESimBaseController(),
      fenix: true,
    );
    Get.lazyPut<SelectedCountrySimsController>(
      () => SelectedCountrySimsController(),
      fenix: true,
    );
    Get.lazyPut<SimInfoController>(
      () => SimInfoController(),
      fenix: true,
    );
    Get.lazyPut<DeviceCompatibilityController>(
      () => DeviceCompatibilityController(),
      fenix: true,
    );
    Get.lazyPut<ProfileBaseController>(
      () => ProfileBaseController(),
      fenix: true,
    );
  }
}
