import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginTest extends StatefulWidget {
  const LoginTest({super.key});

  @override
  State<LoginTest> createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Login animated')),
    );
  }
}
