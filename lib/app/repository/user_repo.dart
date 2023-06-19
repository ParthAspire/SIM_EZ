import 'dart:convert';

import 'package:get/get.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/account_info/change_password/model/request/change_password_request_model.dart';
import 'package:sim_ez/app/screens/dashboard_screen/profile/base/model/response/profile_response_model.dart';
import 'package:sim_ez/app/services/api_calls.dart';
import 'package:sim_ez/app/services/api_constants.dart';
import 'package:sim_ez/app/utils/alert_message_utils.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/response_status_codes.dart';

class UserRepo {
  Future<bool?> changePasswordApiCall(
      {required ChangePasswordRequestModel requestModel}) async {
    try {
      var response = await ApiService().postRequest(
          endPoint: ApiConst.changePassword,
          requestModel: changePasswordRequestModelToJson(requestModel));

      if (response != null) {
        var responseModel = jsonDecode(response.body);
        if (responseModel['response_code'] == successCode) {
          return true;
        } else {
          Get.find<AlertMessageUtils>()
              .showToastMessages(msg: responseModel['response_message'] ?? '');
        }
      }
    } catch (e) {
      LoggerUtils.logException('changePasswordApiCall', e);
    }
    return false;
  }

  Future<ProfileResponseModel?> getUserDetailsApiCall() async {
    try {
      var response = await ApiService().getRequest(endPoint: '${ApiConst.profile}/',isShowLoader: false) ;
      if(response!=null){
        var responseModel = profileResponseModelFromJson(response.body);

        if(responseModel.responseCode == successCode){
          return responseModel;
        }else{
          Get.find<AlertMessageUtils>().showToastMessages(msg: responseModel.responseMessage??'');
        }
      }
    } catch (e) {
      LoggerUtils.logException('getUserDetailsApiCall', e);
    }

    return null;
  }
}
