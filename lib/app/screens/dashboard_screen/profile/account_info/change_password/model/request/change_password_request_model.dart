// To parse this JSON data, do
//
//     final changePasswordRequestModel = changePasswordRequestModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordRequestModel changePasswordRequestModelFromJson(String str) => ChangePasswordRequestModel.fromJson(json.decode(str));

String changePasswordRequestModelToJson(ChangePasswordRequestModel data) => json.encode(data.toJson());

class ChangePasswordRequestModel {
  String? oldPassword;
  String? newPassword;

  ChangePasswordRequestModel({
    this.oldPassword,
    this.newPassword,
  });

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) => ChangePasswordRequestModel(
    oldPassword: json["old_password"],
    newPassword: json["new_password"],
  );

  Map<String, dynamic> toJson() => {
    "old_password": oldPassword,
    "new_password": newPassword,
  };
}
