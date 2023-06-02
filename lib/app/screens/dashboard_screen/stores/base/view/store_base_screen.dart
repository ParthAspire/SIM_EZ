import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/Widgets/common_text_field.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/color_constants.dart';
import 'package:sim_ez/app/common/image_constants.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/base/controller/store_base_controller.dart';
import 'package:sim_ez/app/utils/text_styles.dart';

class StoreBaseScreen extends GetView<StoreBaseController> {
  const StoreBaseScreen({Key? key}) : super(key: key);

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
            localAndGlobalSimTabBar(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
              child: Text(
                kPopularCountries,
                style: TextStyles.k20ColorBlackBold400,
              ),
            ),
            countryListing(),
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
        hintTextStyle: TextStyles.k12kColor9098B1Bold400Arial,
        preFixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(kIconSearch),
        ),
      ),
    );
  }

  localAndGlobalSimTabBar() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                controller.currentIndex.value = 0;
              },
              child: Container(
                height: 40,
                width: Get.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(kLocalESim,
                    style: controller.currentIndex.value == 0
                        ? TextStyles.k14Color1ADDD0Bold400Arial
                        : TextStyles.k14kColor9098B1Bold400Arial),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                controller.currentIndex.value = 1;
              },
              child: Container(
                height: 40,
                width: Get.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(kGlobalESims,
                    style: controller.currentIndex.value == 1
                        ? TextStyles.k14Color1ADDD0Bold400Arial
                        : TextStyles.k14kColor9098B1Bold400Arial),
              ),
            ),
          ],
        ),
      );
    });
  }

  countryListing() {
    return Expanded(
      child: ListView.builder(
        itemCount: 14,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              controller.navigateToSelectedCountrySimsScreen();
            },
            contentPadding:
                EdgeInsets.only(left: 32, right: 16, top: 0, bottom: 0),
            leading: SvgPicture.asset(kImgTempFlag),
            title: Text('United States'),
            trailing: Icon(Icons.navigate_next_outlined, color: kColor1ADDD0),
          );
        },
      ),
    );
  }
}
