import 'package:vexana/vexana.dart';

class Comment extends INetworkModel<Comment> {
  int? id;
  String? message;
  List<Comment>? replies;

  Comment({this.id, this.message, this.replies});

  @override
  Comment fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] ?? 0,
      message: json['message'] ?? '',
      replies: json['replies'] ?? [],
    );
  }

  @override
  Map<String, dynamic>? toJson() {
    throw UnimplementedError();
  }
}
