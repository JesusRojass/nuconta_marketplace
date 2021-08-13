import 'dart:convert';

class Product {
  String typename;
  String id;
  String image;
  String name;
  String description;

  Product({
    required this.typename,
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        typename: json["__typename"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "image": image,
        "name": name,
        "description": description,
      };
}
