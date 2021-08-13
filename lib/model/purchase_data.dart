// To parse this JSON data, do
//
//     final welcome = purchaseFromJson(jsonString);

import 'dart:convert';

import 'package:nuconta_marketplace/model/user_data.dart';

PurchaseData purchaseFromJson(String str) =>
    PurchaseData.fromJson(json.decode(str));

String purchaseToJson(PurchaseData data) => json.encode(data.toJson());

class PurchaseData {
  bool success;
  dynamic errorMessage;
  User customer;

  PurchaseData({
    required this.success,
    required this.errorMessage,
    required this.customer,
  });

  factory PurchaseData.fromJson(Map<String, dynamic> json) => PurchaseData(
        success: json["success"],
        errorMessage:
            json["errorMessage"] == null ? null : json["errorMessage"],
        customer: User.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "errorMessage": errorMessage,
        "customer": customer.toJson(),
      };
}
