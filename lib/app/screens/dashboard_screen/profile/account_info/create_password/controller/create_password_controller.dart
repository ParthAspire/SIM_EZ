import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePasswordController extends GetxController {
  RxInt stepIndex = 1.obs;

  TextEditingController emailIdController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  RxBool isShowNewPassword = false.obs;
  RxBool isShowConfirmPassword = false.obs;
}
