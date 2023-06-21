import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/model/response/profile_response_model.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';

class ContactUsController extends GetxController{
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController iccidController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Rx<ProfileData> userDetails = ProfileData().obs;

  void setIntentData({required dynamic intentData}) {
    try {
      userDetails.value = (intentData[0] as ProfileData);
      firstNameController.text =
          (userDetails.value.name ?? '').split(' ').first;
      lastNameController.text = (userDetails.value.name ?? '').split(' ').last;
      emailIdController.text = userDetails.value.email ?? '';
    } catch (e) {
      LoggerUtils.logException('setIntentData', e);
    }
  }
}