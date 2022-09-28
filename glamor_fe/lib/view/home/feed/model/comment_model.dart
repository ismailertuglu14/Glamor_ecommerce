import 'package:vexana/vexana.dart';

class Comment extends INetworkModel<Comment> {
  int? id;
  String? message;
  List<Comment>? replies;
  Comment({this.id, this.message, this.replies});
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment();
  }
  @override
  Comment fromJson(Map<String, dynamic> json) {
    return Comment.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    throw UnimplementedError();
  }
}
