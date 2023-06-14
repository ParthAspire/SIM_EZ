import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class SecureCheckOutController extends GetxController {
  RxBool checkBoxFirst = false.obs;
  RxBool checkBoxSecond = false.obs;

  void navigateToPaymenthodsScreen() {
    Get.toNamed(kRoutePaymentMethodsScreen);
  }

  void navigateToApplyCodeScreen() {
    Get.toNamed(kRouteApplyCodeScreen);
  }

}
