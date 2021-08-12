class User {
  final String id;
  final String name;
  final int balance;

  User({
    required this.id,
    required this.name,
    required this.balance,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['viewer']['id'],
      name: json['viewer']['name'],
      balance: json['viewer']['balance'],
    );
  }
}
