import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyESimBaseController extends GetxController{
  RxString userName = 'UserName'.obs;

  TextEditingController searchController = TextEditingController();
}