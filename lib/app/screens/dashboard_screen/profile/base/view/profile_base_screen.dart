import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/controller/profile_base_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class ProfileBaseScreen extends GetView<ProfileBaseController> {
  const ProfileBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          children: [
            /// user name
            Row(
              children: [
                SvgPicture.asset(kIconDefaultUser),
                SizedBox(width: 8),
                const Text('$kHello, UserName',
                    style: TextStyles.k20ColorBlackBold400),
              ],
            ),

            /// first card
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: kColorF8F8F8,
              margin: EdgeInsets.only(top: 14),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      controller.navigateToAccountInfoScreen();
                    },
                    child: ListTile(
                      title: const Text(kAccountInformation,
                          style: TextStyles.k16kColorBlackBold400Arial),
                      trailing: InkWell(
                        child: const Icon(Icons.navigate_next_outlined,
                            size: 24, color: kColorBlack),
                      ),
                    ),
                  ),
                  Container(height: 0.3, color: kColorD9D9D9),
                  ListTile(
                    title: const Text(kSavedCards,
                        style: TextStyles.k16kColorBlackBold400Arial),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.navigate_next_outlined,
                          size: 24, color: kColorBlack),
                    ),
                  ),
                  Container(height: 0.3, color: kColorD9D9D9),
                  ListTile(
                    title: const Text(kOrders,
                        style: TextStyles.k16kColorBlackBold400Arial),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.navigate_next_outlined,
                          size: 24, color: kColorBlack),
                    ),
                  ),
                ],
              ),
            ),

            /// second card
            Card(
              elevation: 6,
              color: kColorF8F8F8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.only(top: 14),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(kFAQ,
                        style: TextStyles.k16kColorBlackBold400Arial),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.navigate_next_outlined,
                          size: 24, color: kColorBlack),
                    ),
                  ),
                  Container(height: 0.3, color: kColorD9D9D9),
                  ListTile(
                    title: const Text(kContactUs,
                        style: TextStyles.k16kColorBlackBold400Arial),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.navigate_next_outlined,
                          size: 24, color: kColorBlack),
                    ),
                  ),
                  Container(height: 0.3, color: kColorD9D9D9),
                  ListTile(
                    title: const Text(kMoreInfo,
                        style: TextStyles.k16kColorBlackBold400Arial),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.navigate_next_outlined,
                          size: 24, color: kColorBlack),
                    ),
                  ),
                ],
              ),
            ),

            /// Third card
            Card(
              elevation: 6,
              color: kColorF8F8F8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.only(top: 14),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(kRateApp,
                        style: TextStyles.k16kColorBlackBold400Arial),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.navigate_next_outlined,
                          size: 24, color: kColorBlack),
                    ),
                  ),
                  Container(height: 0.3, color: kColorD9D9D9),
                  ListTile(
                    title: const Text(kLogOut,
                        style: TextStyles.k16kColorBlackBold400Arial),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.navigate_next_outlined,
                          size: 24, color: kColorBlack),
                    ),
                  ),
                ],
              ),
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
      automaticallyImplyLeading: false,
      title: const Text(kProfile, style: TextStyles.k20ColorBlackBold400),
      centerTitle: true,
    );
  }
}
