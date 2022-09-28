import 'package:vexana/vexana.dart';

class Category extends INetworkModel<Category> {
  int? id;
  String? title;

  Category({this.id, this.title});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }
  @override
  Category fromJson(Map<String, dynamic> json) {
    return Category.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    throw UnimplementedError();
  }
}
