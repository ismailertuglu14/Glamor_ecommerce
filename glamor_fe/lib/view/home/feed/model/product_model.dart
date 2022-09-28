// import 'package:client/view/home/feed/model/rating_model.dart';
// import 'package:vexana/vexana.dart';

// class Product extends INetworkModel<Product> {
//   int? id;
//   String? title;
//   dynamic price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;

//   Product({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.category,
//     this.image,
//     this.rating,
//   });

//   Product copyWith({
//     int? id,
//     String? title,
//     dynamic price,
//     String? description,
//     String? category,
//     String? image,
//     Rating? rating,
//   }) {
//     return Product(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       price: price ?? this.price,
//       description: description ?? this.description,
//       category: category ?? this.category,
//       image: image ?? this.image,
//       rating: rating ?? this.rating,
//     );
//   }

//   @override
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'price': price,
//       'description': description,
//       'category': category,
//       'image': image,
//       'rating': rating,
//     };
//   }

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'] as int?,
//       title: json['title'] as String?,
//       price: json['price'],
//       description: json['description'] as String?,
//       category: json['category'] as String?,
//       image: json['image'] as String?,
//       rating: json['rating'] == null
//           ? null
//           : Rating.fromJson(json['rating'] as Map<String, dynamic>),
//     );
//   }

//   @override
//   Product fromJson(Map<String, dynamic> json) {
//     return Product.fromJson(json);
//   }
// }

import 'package:vexana/vexana.dart';

class Product extends INetworkModel<Product> {
  String? title;
  String? description;
  double? price;
  String? location;
  Brand? brand;
  User? user;

  Product({
    this.title,
    this.description,
    this.price,
    this.location,
    this.brand,
    this.user,
  });

  Product copyWith({
    String? title,
    String? description,
    double? price,
    String? location,
    Brand? brand,
    User? user,
  }) {
    return Product(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      location: location ?? this.location,
      brand: brand ?? this.brand,
      user: user ?? this.user,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'location': location,
      'brand': brand,
      'user': user,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as double?,
      location: json['location'] as String?,
      // brand: json['brand'] == null
      //     ? null
      //     : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      // user: json['user'] == null
      //     ? null
      //     : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
  @override
  Product fromJson(Map<String, dynamic> json) {
    return Product.fromJson(json);
  }
}

class Brand {
  int? id;
  String? name;

  Brand({
    this.id,
    this.name,
  });

  Brand copyWith({
    int? id,
    String? name,
  }) {
    return Brand(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }
}

class User {
  int? id;
  String? name;
  String? lastname;
  String? password;
  String? avatar;

  User({
    this.id,
    this.name,
    this.lastname,
    this.password,
    this.avatar,
  });

  User copyWith({
    int? id,
    String? name,
    String? lastname,
    String? password,
    String? avatar,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'password': password,
      'avatar': avatar,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      avatar: json['avatar'] as String?,
    );
  }
}
