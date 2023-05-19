import 'package:get/get.dart';
import 'package:sim_ez/app/screens/authentication/login/controller/login_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
