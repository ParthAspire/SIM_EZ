import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class MoreInfoController extends GetxController {
  void navigateToAboutSimEzScreen(){
    Get.toNamed(kRouteAboutSimEzScreen);
  }

  void navigateToPrivacyPolicyScreen() {
    Get.toNamed(kRoutePrivacyPolicyScreen);
  }

  void navigateToTermsAndConditionScreen() {
    Get.toNamed(kRouteTermsAndConditionScreen);
  }
}
