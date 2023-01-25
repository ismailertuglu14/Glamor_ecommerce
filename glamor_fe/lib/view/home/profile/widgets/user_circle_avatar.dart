import 'package:flutter/material.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    Key? key,
  }) : super(key: key);

  final String _userImage = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        maxRadius: 50,
        minRadius: 10,
        backgroundImage: NetworkImage(_userImage));
  }
}
