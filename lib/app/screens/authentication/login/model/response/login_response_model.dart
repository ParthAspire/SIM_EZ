// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  int? responseCode;
  String? responseMessage;
  String? token;
  LoginData? responseData;

  LoginResponseModel({
    this.responseCode,
    this.responseMessage,
    this.token,
    this.responseData,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        responseCode: json["response_code"],
        responseMessage: json["response_message"],
        token: json["Token"] == null ? null : json['Token'],
        responseData: json["response_data"] == null
            ? null
            : LoginData.fromJson(json["response_data"]),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "response_message": responseMessage,
        "Token": token,
        "response_data": (responseData)?.toJson(),
      };
}

class LoginData {
  String? email;
  String? loginType;
  String? socialId;
  String? accountVerify;
  bool? isActive;
  bool? isDeleted;
  String? id;
  String? name;

  LoginData({
    this.email,
    this.loginType,
    this.socialId,
    this.accountVerify,
    this.isActive,
    this.isDeleted,
    this.id,
    this.name,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        email: json["email"],
        loginType: json["login_type"],
        socialId: json["social_id"],
        accountVerify: json["account_verify"],
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "login_type": loginType,
        "social_id": socialId,
        "account_verify": accountVerify,
        "is_active": isActive,
        "is_deleted": isDeleted,
        "_id": id,
        "name": name,
      };
}
