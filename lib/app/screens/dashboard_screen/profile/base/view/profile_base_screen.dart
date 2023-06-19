import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_dialog.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
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
            Obx(() {
              return Row(
                children: [
                  SvgPicture.asset(kIconDefaultUser),
                  SizedBox(width: 8),
                  Text('$kHello, ${controller.userName.value}',
                      style: TextStyles.k20ColorBlackBold400),
                ],
              );
            }),

            /// first card
            Obx(() {
              return Visibility(
                visible: controller.isLoggedIn.value,
                child: Card(
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
                      // Container(height: 0.3, color: kColorD9D9D9),
                      // ListTile(
                      //   title: const Text(kSavedCards,
                      //       style: TextStyles.k16kColorBlackBold400Arial),
                      //   trailing: InkWell(
                      //     onTap: () {},
                      //     child: const Icon(Icons.navigate_next_outlined,
                      //         size: 24, color: kColorBlack),
                      //   ),
                      // ),
                      Container(height: 0.3, color: kColorD9D9D9),
                      InkWell(
                        onTap: () {
                          controller.navigateToOrdersScreen();
                        },
                        child: ListTile(
                          title: const Text(kOrders,
                              style: TextStyles.k16kColorBlackBold400Arial),
                          trailing: InkWell(
                            onTap: () {
                              controller.navigateToOrdersScreen();
                            },
                            child: const Icon(Icons.navigate_next_outlined,
                                size: 24, color: kColorBlack),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

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
                  InkWell(
                    onTap: () {
                      controller.navigateToContactUsScreen();
                    },
                    child: ListTile(
                      title: const Text(kContactUs,
                          style: TextStyles.k16kColorBlackBold400Arial),
                      trailing: InkWell(
                        onTap: () {
                          controller.navigateToContactUsScreen();
                        },
                        child: const Icon(Icons.navigate_next_outlined,
                            size: 24, color: kColorBlack),
                      ),
                    ),
                  ),
                  Container(height: 0.3, color: kColorD9D9D9),
                  InkWell(
                    onTap: () {
                      controller.navigateToMoreInfoScreen();
                    },
                    child: ListTile(
                      title: const Text(kMoreInfo,
                          style: TextStyles.k16kColorBlackBold400Arial),
                      trailing: InkWell(
                        onTap: () {
                          controller.navigateToMoreInfoScreen();
                        },
                        child: const Icon(Icons.navigate_next_outlined,
                            size: 24, color: kColorBlack),
                      ),
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
                  Obx(() {
                    return InkWell(
                      onTap: () {
                        if (controller.isLoggedIn.value == false) {
                          controller.navigateToLoginScreen();
                        } else {
                          showLogoutDialog();
                        }
                      },
                      child: ListTile(
                        title: Text(
                            controller.isLoggedIn.value == false
                                ? kLogIn
                                : kLogOut,
                            style: TextStyles.k16kColorBlackBold400Arial),
                        trailing: InkWell(
                          onTap: () {
                            showLogoutDialog();
                          },
                          child: const Icon(Icons.navigate_next_outlined,
                              size: 24, color: kColorBlack),
                        ),
                      ),
                    );
                  }),
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

  showLogoutDialog() {
    return showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!,
      builder: (context) {
        return commonDialog(
          title: kLogOutText,
          submitText: kLogOut.toUpperCase(),
          cancelText: kCancel.toUpperCase(),
          onSubmit: () {
            Get.back();
            controller.logOutAndClearStorage();
          },
          onCancel: () {
            Get.back();
          },
        );
      },
    );
  }
}
