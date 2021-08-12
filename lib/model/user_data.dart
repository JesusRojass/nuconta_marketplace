import 'dart:convert';

class User {
  final String id;
  final String name;
  final int balance;

  User({
    required this.id,
    required this.name,
    required this.balance,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "balance": balance,
      };
}
