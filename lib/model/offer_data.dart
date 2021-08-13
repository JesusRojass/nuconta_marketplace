// To parse this JSON data, do
//
//     final offdata = offdataFromJson(jsonString);

import 'dart:convert';

import 'package:graphql/client.dart';

import 'product_data.dart';

RootOfferTree offdataFromJson(String str) =>
    RootOfferTree.fromJson(json.decode(str));

String offdataToJson(RootOfferTree data) => json.encode(data.toJson());

class RootOfferTree {
  RootOfferTree({
    required this.typename,
    required this.offers,
  });

  String typename;
  List<Offer> offers;

  factory RootOfferTree.fromJson(Map<String, dynamic> json) => RootOfferTree(
        typename: json["__typename"],
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
      };
}

class Offer {
  String typename;
  String id;
  Product product;
  int price;

  Offer({
    required this.typename,
    required this.id,
    required this.product,
    required this.price,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        typename: json["__typename"],
        id: json["id"],
        product: Product.fromJson(json["product"]),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "product": product.toJson(),
        "price": price,
      };
}
