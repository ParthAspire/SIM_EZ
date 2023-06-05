import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';

class SimInfoController extends GetxController {
  CarouselController simController = CarouselController();
  List<String> tempList = [];

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    for (int i = 0; i < 10; i++) {
      tempList.add('dummy data');
    }

    super.onInit();
  }

  void navigateToDeviceCompatibilityScreen() {
    Get.toNamed(kRouteDeviceCompatibilityScreen);
  }

  void navigateToAdditionalInfoScreen() {
    Get.toNamed(kRouteAdditionalInfoScreen);
  }
}
