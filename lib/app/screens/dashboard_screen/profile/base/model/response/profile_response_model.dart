// To parse this JSON data, do
//
//     final profileResponseModel = profileResponseModelFromJson(jsonString);

import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) =>
    ProfileResponseModel.fromJson(json.decode(str));

class ProfileResponseModel {
  int? responseCode;
  String? responseMessage;
  ProfileData? responseData;

  ProfileResponseModel({
    this.responseCode,
    this.responseMessage,
    this.responseData,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        responseCode: json["response_code"],
        responseMessage: json["response_message"],
        responseData: json["response_data"] == null
            ? null
            : ProfileData.fromJson(json["response_data"]),
      );
}

class ProfileData {
  String? email;
  String? loginType;
  String? socialId;
  String? accountVerify;
  bool? isActive;
  bool? isDeleted;
  String? id;
  String? name;

  ProfileData({
    this.email,
    this.loginType,
    this.socialId,
    this.accountVerify,
    this.isActive,
    this.isDeleted,
    this.id,
    this.name,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        email: json["email"],
        loginType: json["login_type"],
        socialId: json["social_id"],
        accountVerify: json["account_verify"],
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        id: json["_id"],
        name: json["name"],
      );
}
