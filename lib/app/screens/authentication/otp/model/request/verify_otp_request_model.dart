// To parse this JSON data, do
//
//     final verifyOtpRequestModel = verifyOtpRequestModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpRequestModel verifyOtpRequestModelFromJson(String str) => VerifyOtpRequestModel.fromJson(json.decode(str));

String verifyOtpRequestModelToJson(VerifyOtpRequestModel data) => json.encode(data.toJson());

class VerifyOtpRequestModel {
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? otp;

  VerifyOtpRequestModel({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.otp,
  });

  factory VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) => VerifyOtpRequestModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phone_number"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "phone_number": phoneNumber,
    "otp": otp,
  };
}
