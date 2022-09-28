import 'package:vexana/vexana.dart';

class Subcategory extends INetworkModel<Subcategory> {
  Subcategory({
    this.title,
    this.subcategories,
  });
  String? title;
  List<Subcategories>? subcategories;

  Subcategory.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? '';
    subcategories = List.from(json['subcategories'])
        .map((e) => Subcategories.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  Subcategory fromJson(Map<String, dynamic> json) {
    return Subcategory.fromJson(json);
  }
}

class Subcategories {
  Subcategories({
    this.id,
    this.title,
  });
  int? id;
  String? title;

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    return _data;
  }
}
