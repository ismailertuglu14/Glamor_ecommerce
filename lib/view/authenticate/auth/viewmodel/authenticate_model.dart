import 'package:client/product/provider/user_provider.dart';
import 'package:client/view/authenticate/auth/view/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AuthenticateModel extends State<Authenticate> {
  String? token;
  late UserProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<UserProvider>(context, listen: false);
    token = provider.getToken();
  }

  parseTokenToUser() {
    //Do Something
  }
  @override
  void dispose() {
    super.dispose();
  }
}
