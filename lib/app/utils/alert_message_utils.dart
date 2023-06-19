import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

import '../common/color_constants.dart';
import 'logger_utils.dart';

class AlertMessageUtils {
  void showSnackBar(
      {String title = '',
      String message = '',
      SnackPosition snackBarPosition = SnackPosition.BOTTOM,
      Color bgColor = kColorPrimary,
      Color textColor = kColorBlack}) {
    Get.snackbar(title, message,
        snackPosition: snackBarPosition,
        backgroundGradient: LinearGradient(colors: [
          const Color(0XFF371400).withOpacity(0.5),
          const Color(0XFF371400).withOpacity(1),
        ]),
        colorText: textColor);
  }

  void showToastMessages(
      {String msg = '',
      TextStyle textStyle = TextStyles.k16kColorPrimaryBold400}) {
    Get.snackbar('', msg,
        isDismissible: true,
        colorText: kColorPrimary,
        backgroundColor: kColorWhite,
        margin: const EdgeInsets.all(10),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(msg, style: textStyle),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.close),
            )
          ],
        ),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 8);
  }

  /// show loader dialog
  void showLoaderDialog() {
    try {
      showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (context) {
          return SpinKitFadingCircle(
            color: kColorPrimary,
          );
        },
      );
    } catch (e) {
      LoggerUtils.logException('showLoaderDialog', e);
    }
  }

  /// hide loader dialog
  void hideLoaderDialog() {
    try {
      Navigator.of(Get.overlayContext!).pop();
    } catch (e) {
      LoggerUtils.logException('hideLoaderDialog', e);
    }
  }
}
