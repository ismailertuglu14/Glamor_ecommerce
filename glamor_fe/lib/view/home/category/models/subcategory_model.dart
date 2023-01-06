import 'package:vexana/vexana.dart';

class Subcategory extends INetworkModel<Subcategory> {
  Subcategory({
    this.id,
    this.title,
  });

  int? id;
  String? title;
  @override
  Subcategory fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
