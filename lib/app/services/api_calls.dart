import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sim_ez/app/services/api_constants.dart';
import 'package:sim_ez/app/services/common_headers.dart';
import 'package:sim_ez/app/utils/aler_message_utils.dart';
import 'package:sim_ez/app/utils/logger_utils.dart';

class ApiService {
  Future<http.Response?> getRequest(
      {required String endPoint, bool isShowLoader = true}) async {
    try {
      if (isShowLoader) {
        Get.find<AlertMessageUtils>().showLoaderDialog();
      }
      var domainUrl = ApiConst.baseUrl;

      var headers = await commonHeaders();
      debugPrint('headers :::: $headers');
      var url = Uri.parse(domainUrl + endPoint);
      debugPrint('url :::: $url');
      var response = await http.get(url, headers: headers);
      //  debugPrint('response :::: $response');
      return response;
    } catch (e) {
      LoggerUtils.logException('getRequest', e);
    } finally {
      if (isShowLoader) {
        Get.find<AlertMessageUtils>().hideLoaderDialog();
      }
    }
    return null;
  }

  Future<http.Response?> postRequest({required String endPoint,
    dynamic requestModel,
    bool isShowLoader = true}) async {
    try {
      if (isShowLoader) {
        Get.find<AlertMessageUtils>().showLoaderDialog();
      }
      debugPrint('requestModel :::: $requestModel');
      var domainUrl = ApiConst.baseUrl;

      var headers = await commonHeaders();
      debugPrint('headers :::: $headers');

      var url = Uri.parse(domainUrl + endPoint);
      debugPrint('url :::: $url');
      var response = await http.post(url, body: requestModel, headers: headers);
      debugPrint('response :::: ${response.body}');
      return response;
    } catch (e) {
      LoggerUtils.logException('postRequest', e);
    } finally {
      if (isShowLoader) {
        Get.find<AlertMessageUtils>().hideLoaderDialog();
      }
    }
    return null;
  }}