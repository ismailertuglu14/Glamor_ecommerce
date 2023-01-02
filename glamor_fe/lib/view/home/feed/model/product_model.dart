import 'package:vexana/vexana.dart';

class Product extends INetworkModel<Product> {
  String? title;
  String? description;
  double? price;
  String? location;
  Brand? brand;
  User? user;
  ProductImage? images;

  Product(
      {this.title,
      this.description,
      this.price,
      this.location,
      this.brand,
      this.user,
      this.images});

  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'location': location,
      'brand': brand,
      'user': user,
      //'images': images,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as double?,
      location: json['location'] as String?,
      images: json['images'] == null
          ? null
          : ProductImage.fromJson(json['images'][0] as Map<String, dynamic>),
      // brand: json['brand'] == null
      //     ? null
      //     : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
  @override
  Product fromJson(Map<String, dynamic> json) {
    return Product.fromJson(json);
  }
}

class ProductImage {
  String? id;
  String? name;
  String? directory;

  ProductImage({this.id, this.name, this.directory});

  ProductImage copyWith({String? id, String? name, String? directory}) {
    return ProductImage(
      id: id ?? this.id,
      name: name ?? this.name,
      directory: directory ?? this.directory,
    );
  }

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      directory: json['directory'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'directory': directory,
    };
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
