import 'package:flutter/material.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

commonDialog({
  required String title,
  required String submitText,
  required String cancelText,
  required onSubmit(),
  required onCancel(),
}) {
  return Dialog(
    clipBehavior: Clip.none,
    insetPadding: EdgeInsets.symmetric(horizontal: 20),
    backgroundColor: kColor1ADDD0,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(18),
          child: Text(
            title,
            style: TextStyles.k18kColorWhiteBold400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              primaryButton(
                  onPress: onSubmit,
                  buttonTxt: submitText,
                  height: 34,
                  width: 98,
                  textStyle: TextStyles.k14ColorWhiteBold400Arial),
              primaryButton(
                  onPress: onCancel,
                  buttonTxt: cancelText,
                  height: 34,
                  width: 98,
                  textStyle: TextStyles.k14ColorWhiteBold400Arial),
            ],
          ),
        ),
      ],
    ),
  );
}
