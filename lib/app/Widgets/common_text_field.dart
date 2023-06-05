import 'package:flutter/material.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

Widget commonTextField({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  Widget? preFixIcon,
  Widget? suffixIcon,
  FocusNode? focusNode,
  TextInputType keyboardType = TextInputType.text,
  int maxLength = 50,
  double elevation = 8.0,
  int maxLines = 1,
  bool enabled = true,
  bool obscure = false,
  bool isShowElevation = true,
  Color filledColor = kColorF8F8F8,
  TextStyle hintTextStyle = TextStyles.k14Color686868Bold400,
  TextStyle labelTextStyle = TextStyles.k12kColorBlackBold400Arial,
}) {
  return SizedBox(
    // height: 60,
    child: Card(
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      elevation: isShowElevation ? 5 : 0,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: maxLines,
        enabled: enabled,
        obscureText: obscure,
        // autofocus: true,
        focusNode: focusNode,
        cursorColor: kColor1ADDD0,
        decoration: InputDecoration(
          fillColor: filledColor,
          filled: true,
          hintText: hintText,
          hintStyle: hintTextStyle,
          labelText: labelText,
          labelStyle: labelTextStyle,
          prefixIcon: preFixIcon,
          suffixIcon: suffixIcon,
          counterText: '',
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent, width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent)),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent, width: 1),
          ),
        ),
      ),
    ),
  );
}
