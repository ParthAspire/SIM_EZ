import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

Widget primaryButton({
  required Function onPress,
  required String buttonTxt,
  double? width,
  double? height,
  TextStyle  textStyle =TextStyles.k14ColorWhiteBold400,
}) {
  return MaterialButton(
    padding: EdgeInsets.zero,
    onPressed: () {
      onPress();
    },
    child: Container(
      width: width == null ? Get.width : width,
      height: height == null ? 58 : height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kColorPrimary,
      ),
      child: Text(
        buttonTxt,
        style: textStyle,
      ),
    ),
  );
}
