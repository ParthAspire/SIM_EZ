import 'package:get/get.dart';

class MainAuthController extends GetxController{

  RxInt currentIndex = 0.obs;
  RxBool isUpdate = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeIndex(value){
    isUpdate.value = !isUpdate.value;
    currentIndex.value = value;
  }
}