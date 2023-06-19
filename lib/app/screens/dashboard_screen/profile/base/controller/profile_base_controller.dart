import 'package:get/get.dart';
import 'package:sim_ez/app/common/local_storage_constants.dart';
import 'package:sim_ez/app/common/rounting_constants.dart';
import 'package:sim_ez/app/repository/user_repo.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/model/response/profile_response_model.dart';
import 'package:sim_ez/app/services/gmail_services.dart';
import 'package:sim_ez/app/utils/local_storage.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';

class ProfileBaseController extends GetxController {
  LocalStorage localStorage = Get.put(LocalStorage());

  RxBool isLoggedIn = false.obs;

  RxString userName = ''.obs;
  Rx<ProfileData> userDetails = ProfileData().obs;

  Future<void> checkUserIsLoggedIn() async {
    isLoggedIn.value =
        await localStorage.getBoolFromStorage(kStorageIsLoggedIn);
    Get.find<LocalStorage>().isLoggedIn.value = isLoggedIn.value;
  }

  @override
  Future<void> onInit() async {
    Get.lazyPut(() => UserRepo(),fenix: true);
    await checkUserIsLoggedIn();
    await getUserDetailsFromServer();
    Get.find<LocalStorage>().isLoggedIn.listen((p0) {
      isLoggedIn.value = p0;
      getUserDetailsFromServer();
    });
    super.onInit();
  }

  getUserDetailsFromServer() async {
    try {
      var response = await Get.find<UserRepo>().getUserDetailsApiCall();

      if (response != null && response.responseData != null) {
        userDetails.value = response.responseData!;
        userName.value = userDetails.value.name??'';
      }
    } catch (e) {
      LoggerUtils.logException('getUserDetailsFromServer', e);
    }
  }

  void navigateToAccountInfoScreen() {
    Get.toNamed(kRouteAccountInfoBaseScreen,arguments: [userDetails.value]);
  }

  void navigateToContactUsScreen() {
    Get.toNamed(kRouteContactUsScreen);
  }

  void navigateToMoreInfoScreen() {
    Get.toNamed(kRouteMoreInfoScreen);
  }

  void navigateToOrdersScreen() {
    Get.toNamed(kRouteOrdersBaseScreen);
  }

  void navigateToLoginScreen() {
    Get.toNamed(kRouteMainAuthScreen);
  }

  void logOutAndClearStorage() {
    Get.find<LocalStorage>().clearAllStorageData();
    Get.find<LocalStorage>().isLoggedIn.value = false;
    GmailServices().googleSignIn.signOut();
    userName.value = '';
  }
}
