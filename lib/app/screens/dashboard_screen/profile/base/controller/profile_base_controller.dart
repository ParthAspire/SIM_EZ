import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class ProfileBaseController extends GetxController {
  void navigateToAccountInfoScreen() {
    Get.toNamed(kRouteAccountInfoBaseScreen);
  }

  void navigateToContactUsScreen() {
    Get.toNamed(kRouteContactUsScreen);
  }

  void navigateToMoreInfoScreen() {
    Get.toNamed(kRouteMoreInfoScreen);
  }

  void navigateToOrdersScreen() {
    Get.toNamed(kRouteOrdersBaseScreen);
  }
}
