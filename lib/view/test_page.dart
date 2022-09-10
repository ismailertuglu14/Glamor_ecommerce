import 'package:client/product/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(context.read<UserProvider>().user.username),
          Text(context.read<UserProvider>().user.email),
          Text(context.read<UserProvider>().user.type.toString()),
        ],
      )),
    );
  }
}
