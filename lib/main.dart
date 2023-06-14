import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim_ez/app/common/app_constants.dart';
import 'package:sim_ez/app/common/controller_binding.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/screens/authentication/base/view/main_auth_screen.dart';
import 'package:sim_ez/app/screens/authentication/login/view/login_screen.dart';
import 'package:sim_ez/app/screens/authentication/otp/view/otp_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/view/bottom_nav_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/installation/view/installation_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/purchased_sim_info/view/purchased_sim_info_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/step_by_step_guide/view/guide_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/payment/apply_code/view/apply_code_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/payment/payment_methods/view/payment_methods_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/payment/secure_checkout/view/secure_checkout_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/base/view/account_info_base_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/change_email/view/change_email_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/change_password/view/change_password_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/create_password/view/create_password_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/contact_us/view/contact_us_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/more_info/about_sim_ez/view/about_sim_ez_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/more_info/base/view/more_info_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/more_info/privacy_policy/view/privacy_policy_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/more_info/terms_and_condition/view/terms_and_condition_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/orders/base/view/orders_base_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/orders/order_details/view/order_details_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/additional_info/base/view/additional_info_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/base/view/selected_country_sims_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/device_compatibility/view/device_compatibility_screen.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/sim_info_screen/view/sim_info_screen.dart';
import 'package:sim_ez/app/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
         FocusManager.instance.primaryFocus?.unfocus();
       },
      child: GetMaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        initialBinding: ControllerBinding(),
        routingCallback: (value) {
          AppConstants().currentRoute = value?.current ?? '';
          debugPrint(' ############# routing callback : ${value?.current}');
        },
        home: const SplashScreen(),
        getPages: [
          GetPage(
            name: kRouteMainAuthScreen,
            page: () => MainAuthScreen(),
          ),
          GetPage(
            name: kRouteLoginScreen,
            page: () => LoginScreen(),
          ),
          GetPage(
            name: kRouteBottomNavScreen,
            page: () => BottomNavScreen(),
          ),
          GetPage(
            name: kRouteSelectedCountrySimsScreen,
            page: () => SelectedCountrySimsScreen(),
          ),
          GetPage(
            name: kRouteSimInfoScreen,
            page: () => SimInfoScreen(),
          ),
          GetPage(
            name: kRouteDeviceCompatibilityScreen,
            page: () => DeviceCompatibilityScreen(),
          ),
          GetPage(
            name: kRouteAdditionalInfoScreen,
            page: () => AdditionalInfoScreen(),
          ),
          GetPage(
            name: kRouteAccountInfoBaseScreen,
            page: () => AccountInfoBaseScreen(),
          ),
          GetPage(
            name: kRouteChangePasswordScreen,
            page: () => ChangePasswordScreen(),
          ),
          GetPage(
            name: kRouteChangeEmailScreen,
            page: () => ChangeEmailScreen(),
          ),
          GetPage(
            name: kRouteCreatePasswordScreen,
            page: () => CreatePasswordScreen(),
          ),
          GetPage(
            name: kRouteContactUsScreen,
            page: () => ContactUsScreen(),
          ),
          GetPage(
            name: kRoutePurchasedSimInfoScreen,
            page: () => PurchasedSimInfoScreen(),
          ),
          GetPage(
            name: kRouteMoreInfoScreen,
            page: () => MoreInfoScreen(),
          ),
          GetPage(
            name: kRouteAboutSimEzScreen,
            page: () => AboutSimEzScreen(),
          ),
          GetPage(
            name: kRoutePrivacyPolicyScreen,
            page: () => PrivacyPolicyScreen(),
          ),
          GetPage(
            name: kRouteTermsAndConditionScreen,
            page: () => TermsAndConditionScreen(),
          ),
          GetPage(
            name: kRouteOrdersBaseScreen,
            page: () => OrdersBaseScreen(),
          ),
          GetPage(
            name: kRouteInstallationScreen,
            page: () => InstallationScreen(),
          ),
          GetPage(
            name: kRouteOrderDetailsScreen,
            page: () => OrderDetailsScreen(),
          ),
          GetPage(
            name: kRouteOtpScreen,
            page: () => OtpScreen(),
          ),
          GetPage(
            name: kRouteSecureCheckoutScreen,
            page: () => SecureCheckoutScreen(),
          ),
          GetPage(
            name: kRoutePaymentMethodsScreen,
            page: () => PaymentMethodsScreen(),
          ),
          GetPage(
            name: kRouteApplyCodeScreen,
            page: () => ApplyCodeScreen(),
          ),
          GetPage(
            name: kRouteGuideScreen,
            page: () => GuideScreen(),
          ),
        ],
      ),
    );
  }
}
