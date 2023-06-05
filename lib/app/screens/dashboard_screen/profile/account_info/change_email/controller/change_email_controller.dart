import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeEmailController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController newEmailIdController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();

  RxBool isShowPassword = false.obs;
}
