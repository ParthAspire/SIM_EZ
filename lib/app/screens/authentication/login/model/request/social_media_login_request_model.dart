// To parse this JSON data, do
//
//     final socialMediaLoginRequestModel = socialMediaLoginRequestModelFromJson(jsonString);

import 'dart:convert';

SocialMediaLoginRequestModel socialMediaLoginRequestModelFromJson(String str) =>
    SocialMediaLoginRequestModel.fromJson(json.decode(str));

String socialMediaLoginRequestModelToJson(SocialMediaLoginRequestModel data) =>
    json.encode(data.toJson());

class SocialMediaLoginRequestModel {
  String? name;
  String? email;
  String? socialId;
  String? loginType;

  SocialMediaLoginRequestModel({
    this.name,
    this.email,
    this.socialId,
    this.loginType,
  });

  factory SocialMediaLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      SocialMediaLoginRequestModel(
        name: json["name"],
        email: json["email"],
        socialId: json["social_id"],
        loginType: json["login_type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "social_id": socialId,
        "login_type": loginType,
      };
}
