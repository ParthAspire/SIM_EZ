import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInfoBaseController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();

  RxBool isReceiveEmail = false.obs;
}
