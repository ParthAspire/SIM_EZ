import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/base/controller/account_info_base_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class AccountInfoBaseScreen extends GetView<AccountInfoBaseController> {
  AccountInfoBaseScreen({Key? key}) : super(key: key) {
    final intentData = Get.arguments;
    controller.setIntentData(intentData: intentData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// user name
            Obx(() {
              return Row(
                children: [
                  SvgPicture.asset(kIconDefaultUser),
                  SizedBox(width: 8),
                  Text('$kHello, ${controller.userDetails.value.name??''}',
                      style: TextStyles.k20ColorBlackBold400),
                ],
              );
            }),

            /// first name textfield
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 20),
              child: commonTextField(
                controller: controller.firstNameController,
                hintText: kFirstName,
                labelText: kFirstName,
                // enabled: false,
              ),
            ),

            /// last name textfield
            commonTextField(
              controller: controller.lastNameController,
              hintText: kLastName,
              labelText: kLastName,
              // enabled: false
            ),

            /// email name textfield
            InkWell(
              onTap: () {
                controller.navigateToChangeEmailScreen();
              },
              child: IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: commonTextField(
                      controller: controller.emailIdController,
                      hintText: kEmailId,
                      labelText: kEmailId,
                      // enabled: false,
                      suffixIcon: primaryButton(
                          onPress: () {
                            controller.navigateToChangeEmailScreen();
                          },
                          buttonTxt: kChange.toUpperCase(),
                          width: 75,
                          height: 22,
                          textStyle: TextStyles.k10ColorWhiteBold400Arial)),
                ),
              ),
            ),

            /// current password name textfield
            InkWell(
              onTap: () {
                controller.navigateToChangePasswordScreen();
              },
              child: commonTextField(
                  controller: controller.currentPasswordController,
                  hintText: kCurrentPassword,
                  labelText: kCurrentPassword,
                  enabled: false,
                  suffixIcon: primaryButton(
                      onPress: () {
                        controller.navigateToChangePasswordScreen();
                      },
                      buttonTxt: kChange.toUpperCase(),
                      // buttonTxt: kCreate.toUpperCase(),
                      width: 75,
                      height: 22,
                      textStyle: TextStyles.k10ColorWhiteBold400Arial)),
            ),

            /// check box
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Obx(() {
                    return Checkbox(
                      activeColor: kColorB0B0B0,
                      checkColor: kColorBlack,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity:
                      VisualDensity(horizontal: -4, vertical: -4),
                      value: controller.isReceiveEmail.value,
                      onChanged: (value) {
                        controller.isReceiveEmail.value =
                        !controller.isReceiveEmail.value;
                      },
                    );
                  }),
                  Text(kILikeToReceivePromotionalEmails,
                      style: TextStyles.k14ColorBlackBold400Arial),
                ],
              ),
            ),

            /// delete account
            SizedBox(height: 40),
            Text(kDeleteAccount, style: TextStyles.k20ColorBlackBold400),
            SizedBox(height: 30),
            Text(kDeleteAccountText,
                style: TextStyles.k14ColorBlackBold400Arial),

            /// delete account button
            primaryButton(
                onPress: () {},
                buttonTxt: kDeleteAccount.toUpperCase(),
                height: 22,
                width: 134,
                bgColor: kColorWhite,
                borderColor: kColorRed,
                textStyle: TextStyles.k10ColorRedBold400),

            Spacer(),

            /// save changes button
            primaryButton(
                onPress: () {},
                buttonTxt: kSaveChanges.toUpperCase(),
                height: 38),
          ],
        ),
      ),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: kColorECECEC,
      elevation: 0,
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.navigate_before_outlined,
              color: kColorBlack, size: 30)),
      title: const Text(kAccountInformation,
          style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
