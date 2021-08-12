import 'dart:convert';

class Product {
  Product({
    required this.typename,
    required this.image,
    required this.name,
    required this.description,
  });

  String typename;
  String image;
  String name;
  String description;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        typename: json["__typename"],
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
