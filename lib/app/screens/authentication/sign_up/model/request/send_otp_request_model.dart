// To parse this JSON data, do
//
//     final sendOtpRequestModel = sendOtpRequestModelFromJson(jsonString);

import 'dart:convert';

SendOtpRequestModel sendOtpRequestModelFromJson(String str) => SendOtpRequestModel.fromJson(json.decode(str));

String sendOtpRequestModelToJson(SendOtpRequestModel data) => json.encode(data.toJson());

class SendOtpRequestModel {
  String? email;

  SendOtpRequestModel({
    this.email,
  });

  factory SendOtpRequestModel.fromJson(Map<String, dynamic> json) => SendOtpRequestModel(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
