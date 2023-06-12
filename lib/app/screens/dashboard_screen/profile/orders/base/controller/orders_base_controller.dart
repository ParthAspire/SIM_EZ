import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class OrdersBaseController extends GetxController {
  void navigateToOrderDetailsScreen() {
    Get.toNamed(kRouteOrderDetailsScreen);
  }
}
