import 'dart:convert';

import 'package:get/get.dart';
import 'package:sim_ez/app/screens/authentication/login/model/request/login_request_model.dart';
import 'package:sim_ez/app/screens/authentication/login/model/request/social_media_login_request_model.dart';
import 'package:sim_ez/app/screens/authentication/login/model/response/login_response_model.dart';
import 'package:sim_ez/app/screens/authentication/otp/model/request/verify_otp_request_model.dart';
import 'package:sim_ez/app/screens/authentication/sign_up/model/request/send_otp_request_model.dart';
import 'package:sim_ez/app/services/api_calls.dart';
import 'package:sim_ez/app/services/api_constants.dart';
import 'package:sim_ez/app/utils/alert_message_utils.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';
import 'package:sim_ez/app/utils/response_status_codes.dart';

class AuthRepo {
  /// login api call
  Future<LoginResponseModel?> loginApiCall(
      {required LoginRequestModel requestModel}) async {
    try {
      var response = await ApiService().postRequest(
          endPoint: ApiConst.normalLogin,
          requestModel: loginRequestModelToJson(requestModel));

      if (response != null) {
        var responseModel = loginResponseModelFromJson(response.body);
        if (responseModel.responseCode == successCode) {
          return responseModel;
        } else {
          Get.find<AlertMessageUtils>()
              .showToastMessages(msg: responseModel.responseMessage ?? '');
        }
      }
    } catch (e) {
      LoggerUtils.logException('loginApiCall', e);
    }
    return null;
  }

  /// social media login api call
  Future<LoginResponseModel?> socialMediaLoginApiCall(
      {required SocialMediaLoginRequestModel requestModel}) async {
    try {
      var response = await ApiService().postRequest(
          endPoint: ApiConst.socialLogin,
          requestModel: socialMediaLoginRequestModelToJson(requestModel));

      if (response != null) {
        var responseModel = loginResponseModelFromJson(response.body);
        if (responseModel.responseCode == successCode) {
          return responseModel;
        } else {
          Get.find<AlertMessageUtils>()
              .showToastMessages(msg: responseModel.responseMessage ?? '');
        }
      }
    } catch (e) {
      LoggerUtils.logException('socialMediaLoginApiCall', e);
    }
    return null;
  }

  Future<bool?> sendOtpApiCall(
      {required SendOtpRequestModel requestModel}) async {
    try {
      var response = await ApiService().postRequest(
          endPoint: ApiConst.sendOtp,
          requestModel: sendOtpRequestModelToJson(requestModel));

      if (response != null) {
        var responseModel = jsonDecode(response.body);
        if (responseModel['response_code'] == successCode) {
          return true;
        } else {
          Get.find<AlertMessageUtils>()
              .showToastMessages(msg: responseModel['response_message']??'');
        }
      }
    } catch (e) {
      LoggerUtils.logException('sendOtpApiCall', e);
    }
    return false;
  }


  Future<bool?> verifyOtpApiCall(
      {required VerifyOtpRequestModel requestModel}) async {
    try {
      var response = await ApiService().postRequest(
          endPoint: ApiConst.otpVerify,
          requestModel: verifyOtpRequestModelToJson(requestModel));

      if (response != null) {
        var responseModel = jsonDecode(response.body);
        if (responseModel['response_code'] == successCode) {
          return true;
        } else {
          Get.find<AlertMessageUtils>()
              .showToastMessages(msg: responseModel['response_message']??'');
        }
      }
    } catch (e) {
      LoggerUtils.logException('verifyOtpApiCall', e);
    }
    return false;
  }

  Future<bool?> forgotPasswordApiCall(
      {required SendOtpRequestModel requestModel}) async {
    try {
      var response = await ApiService().postRequest(
          endPoint: ApiConst.forgetPassOtp,
          requestModel: sendOtpRequestModelToJson(requestModel));

      if (response != null) {
        var responseModel = jsonDecode(response.body);
        if (responseModel['response_code'] == successCode) {
          return true;
        } else {
          Get.find<AlertMessageUtils>()
              .showToastMessages(msg: responseModel['response_message']??'');
        }
      }
    } catch (e) {
      LoggerUtils.logException('forgotPasswordApiCall', e);
    }
    return false;
  }

  Future<bool?> verifyForgotPasswordApiCall(
      {required VerifyOtpRequestModel requestModel}) async {
    try {
      var response = await ApiService().postRequest(
          endPoint: ApiConst.forgetPassOtp,
          requestModel: verifyOtpRequestModelToJson(requestModel));

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
      LoggerUtils.logException('verifyForgotPasswordApiCall', e);
    }
    return false;
  }

  Future<bool?> resetPasswordApiCall(
      {required VerifyOtpRequestModel requestModel}) async {
    try {
      var response = await ApiService().postRequest(
          endPoint: ApiConst.saveForgetPassword,
          requestModel: verifyOtpRequestModelToJson(requestModel));

      if (response != null) {
        var responseModel = jsonDecode(response.body);
        if (responseModel['response_code'] == successCode) {
          return true;
        } else {
          Get.find<AlertMessageUtils>()
              .showToastMessages(msg: responseModel['response_message']??'');
        }
      }
    } catch (e) {
      LoggerUtils.logException('restPasswordApiCall', e);
    }
    return false;
  }
}
