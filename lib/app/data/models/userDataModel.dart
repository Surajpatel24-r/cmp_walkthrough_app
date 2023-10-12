// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  String? docId;
  String? fullName;
  String? email;

  UserDataModel({
    this.docId,
    this.fullName,
    this.email,
  });

  UserDataModel copyWith({
    String? docId,
    String? fullName,
    String? email,
  }) =>
      UserDataModel(
        docId: docId ?? this.docId,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
      );

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        docId: json["docId"],
        fullName: json["fullName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "fullName": fullName,
        "email": email,
      };
}
