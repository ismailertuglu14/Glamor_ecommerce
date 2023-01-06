// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'package:vexana/vexana.dart';

class Product extends INetworkModel<Product> {
  Product(
      {this.title,
      this.description,
      this.price,
      this.user,
      this.category,
      this.subcategory,
      this.coverImage});

  String? title;
  String? description;
  dynamic? price;
  User? user;
  String? category;
  String? subcategory;
  String? coverImage;

  @override
  Product fromJson(Map<String, dynamic> json) => Product(
      title: json["title"],
      description: json["description"],
      price: json["price"] == null ? null : json["price"] as dynamic,
      user: json["user"] == null ? null : User.fromMap(json["user"]),
      category: json["category"],
      subcategory: json["subcategory"],
      coverImage: json['coverImage']);

  @override
  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "user": user == null ? null : user!.toMap(),
        "category": category,
        "subcategory": subcategory,
        "coverImage": coverImage
      };
}

class User {
  User({
    this.id,
    this.username,
    this.firstname,
    this.lastname,
  });

  int? id;
  String? username;
  String? firstname;
  String? lastname;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
      };
}
