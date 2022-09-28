// ignore_for_file: prefer_collection_literals, avoid_function_literals_in_foreach_calls

import 'package:vexana/vexana.dart';

class Subcategories extends INetworkModel<Subcategories> {
  String? title;
  List<Subcategories>? subcategories;

  Subcategories({this.title, this.subcategories});

  Subcategories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      (json['subcategories'] as List).forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    if (subcategories != null) {
      data['subcategories'] = subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  Subcategories fromJson(Map<String, dynamic> json) {
    return Subcategories.fromJson(json);
  }
}

class Subcategory {
  int? id;
  String? title;

  Subcategory({this.id, this.title});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
