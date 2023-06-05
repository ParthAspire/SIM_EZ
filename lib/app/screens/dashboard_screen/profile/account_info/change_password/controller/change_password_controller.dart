import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  RxBool isShowPassword = false.obs;
  RxBool isShowNewPassword = false.obs;
  RxBool isShowConfirmPassword = false.obs;
}
