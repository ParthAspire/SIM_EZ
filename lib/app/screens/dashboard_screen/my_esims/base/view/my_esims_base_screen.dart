import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/base/controller/my_esim_base_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class MyESimBaseScreen extends GetView<MyESimBaseController> {
  const MyESimBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appLogo(),
            welcomeText(),
            searchTextField(),
          ],
        ),
      ),
    );
  }

  appLogo() {
    return Align(
      heightFactor: 1.5,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        kIconLogo,
        height: 50,
      ),
    );
  }

  welcomeText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
      child: Text('$kHello, ${controller.userName.value}',
          style: TextStyles.k20ColorBlackBold400),
    );
  }

  searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: commonTextField(
        controller: controller.searchController,
        hintText: kMyESimSearchText,
        hintTextStyle: TextStyles.k12kColor9098B1Bold400,
        preFixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(kIconSearch),
        ),
      ),
    );
  }
}
