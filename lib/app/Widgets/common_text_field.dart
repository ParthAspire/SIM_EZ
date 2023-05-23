import 'package:flutter/material.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

Widget commonTextField(
    {required TextEditingController controller,
    required String hintText,
    Widget? preFixIcon,
    Widget? suffixIcon,
    FocusNode? focusNode,
    TextInputType keyboardType = TextInputType.text,
    int maxLength = 50,
    double elevation = 8.0,
    int maxLines = 1,
    bool enabled = true,
    bool obscure = false,}) {
  return SizedBox(
    height: 50,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      enabled: enabled,
      obscureText: obscure,
      // autofocus: true,
      focusNode: focusNode,cursorColor: kColor1ADDD0,
      decoration: InputDecoration(
        fillColor: kColorECECEC,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyles.k14Color686868Bold400,
        prefixIcon: preFixIcon,
        suffixIcon: suffixIcon,
        counterText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kColor1ADDD0, width: 1),
        ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: kColor1ADDD0
        )),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
      ),
    ),
  );
}
