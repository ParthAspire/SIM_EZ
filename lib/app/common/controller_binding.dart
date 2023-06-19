import 'package:get/get.dart';
import 'package:sim_ez/app/screens/authentication/base/controller/main_auth_controller.dart';
import 'package:sim_ez/app/screens/authentication/forgot_password/controller/forgot_password_controller.dart';
import 'package:sim_ez/app/screens/authentication/login/controller/login_controller.dart';
import 'package:sim_ez/app/screens/authentication/otp/controller/otp_controller.dart';
import 'package:sim_ez/app/screens/authentication/reset_password/controller/reset_password_controller.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/controller/sign_up_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/base/controller/my_esim_base_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/installation/controller/installation_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/purchased_sim_info/controller/purchased_sim_info_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/my_esims/step_by_step_guide/controller/guide_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/payment/apply_code/controller/apply_code_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/payment/payment_methods/controller/payment_methods_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/payment/secure_checkout/controller/secure_checkout_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/base/controller/account_info_base_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/change_email/controller/change_email_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/change_password/controller/change_password_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/create_password/controller/create_password_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/controller/profile_base_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/contact_us/controller/contact_us_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/more_info/about_sim_ez/controller/about_sim_ez_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/more_info/base/controller/more_info_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/more_info/privacy_policy/controller/privacy_policy_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/more_info/terms_and_condition/controller/terms_and_condition_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/orders/base/controller/orders_base_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/orders/order_details/controller/order_details_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/base/controller/store_base_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/additional_info/base/controller/additional_info_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/base/controller/selected_country_sims_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/device_compatibility/controller/device_compatibility_controller.dart';
import 'package:sim_ez/app/screens/dashboard_screen/stores/selected_country_sims/sim_info_screen/controller/sim_info_controller.dart';
import 'package:sim_ez/app/utils/alert_message_utils.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AlertMessageUtils>(
      AlertMessageUtils(),
      permanent: true,
    );

    Get.lazyPut<MainAuthController>(
      () => MainAuthController(),
      fenix: true,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
      fenix: true,
    );
    Get.lazyPut<BottomNavController>(
      () => BottomNavController(),
      fenix: true,
    );
    Get.lazyPut<StoreBaseController>(
      () => StoreBaseController(),
      fenix: true,
    );
    Get.lazyPut<MyESimBaseController>(
      () => MyESimBaseController(),
      fenix: true,
    );
    Get.lazyPut<SelectedCountrySimsController>(
      () => SelectedCountrySimsController(),
      fenix: true,
    );
    Get.lazyPut<SimInfoController>(
      () => SimInfoController(),
      fenix: true,
    );
    Get.lazyPut<DeviceCompatibilityController>(
      () => DeviceCompatibilityController(),
      fenix: true,
    );
    Get.lazyPut<ProfileBaseController>(
      () => ProfileBaseController(),
      fenix: true,
    );
    Get.lazyPut<AdditionalInfoController>(
      () => AdditionalInfoController(),
      fenix: true,
    );
    Get.lazyPut<AccountInfoBaseController>(
      () => AccountInfoBaseController(),
      fenix: true,
    );
    Get.lazyPut<ChangeEmailController>(
      () => ChangeEmailController(),
      fenix: true,
    );
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
      fenix: true,
    );
    Get.lazyPut<CreatePasswordController>(
      () => CreatePasswordController(),
      fenix: true,
    );
    Get.lazyPut<ContactUsController>(
      () => ContactUsController(),
      fenix: true,
    );
    Get.lazyPut<PurchasedSimInfoController>(
      () => PurchasedSimInfoController(),
      fenix: true,
    );
    Get.lazyPut<MoreInfoController>(
      () => MoreInfoController(),
      fenix: true,
    );
    Get.lazyPut<AboutSimEzController>(
      () => AboutSimEzController(),
      fenix: true,
    );
    Get.lazyPut<PrivacyPolicyController>(
      () => PrivacyPolicyController(),
      fenix: true,
    );
    Get.lazyPut<TermsAndConditionController>(
      () => TermsAndConditionController(),
      fenix: true,
    );
    Get.lazyPut<OrdersBaseController>(
      () => OrdersBaseController(),
      fenix: true,
    );
    Get.lazyPut<InstallationController>(
      () => InstallationController(),
      fenix: true,
    );
    Get.lazyPut<OrderDetailsController>(
      () => OrderDetailsController(),
      fenix: true,
    );
    Get.lazyPut<OtpController>(
      () => OtpController(),
      fenix: true,
    );
    Get.lazyPut<SecureCheckOutController>(
      () => SecureCheckOutController(),
      fenix: true,
    );
    Get.lazyPut<PaymentMethodsController>(
      () => PaymentMethodsController(),
      fenix: true,
    );
    Get.lazyPut<ApplyCodeController>(
      () => ApplyCodeController(),
      fenix: true,
    );
    Get.lazyPut<GuideController>(
      () => GuideController(),
      fenix: true,
    );
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
      fenix: true,
    );
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
      fenix: true,
    );
  }
}
