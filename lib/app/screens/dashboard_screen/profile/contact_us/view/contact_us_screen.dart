import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/Widgets/primary_button.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/contact_us/controller/contact_us_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  ContactUsScreen({Key? key}) : super(key: key) {
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
          children: [

            /// user name
            Obx(() {
              return Row(
                children: [
                  SvgPicture.asset(kIconDefaultUser),
                  SizedBox(width: 8),
                  Text('$kHello, ${controller.userDetails.value.name ?? ''}',
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
              ),
            ),

            /// last name textfield
            commonTextField(
              controller: controller.lastNameController,
              hintText: kLastName,
              labelText: kLastName,
            ),

            /// email textfield
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: commonTextField(
                controller: controller.emailIdController,
                hintText: kEmailId,
                labelText: kEmailId,
              ),
            ),

            /// phone number textfield
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: commonTextField(
                controller: controller.phoneNumberController,
                hintText: kPhoneNumber,
                labelText: kPhoneNumber,
              ),
            ),

            /// icci textfield
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: commonTextField(
                controller: controller.iccidController,
                hintText: kSIMEZICCID,
                labelText: kSIMEZICCID,
              ),
            ),

            /// subject  textfield
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: commonTextField(
                controller: controller.subjectController,
                hintText: kSubject,
                labelText: kSubject,
              ),
            ),

            /// message  textfield
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: commonTextField(
                controller: controller.messageController,
                hintText: kMessage,
                labelText: kMessage,
                maxLines: 3,
              ),
            ),

            Spacer(),

            primaryButton(
              onPress: () {},
              buttonTxt: kSend.toUpperCase(),
              height: 38,
            ),
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
      title: const Text(kContactUs, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
