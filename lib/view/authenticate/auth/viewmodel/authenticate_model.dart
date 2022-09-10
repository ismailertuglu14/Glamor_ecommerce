import 'package:client/product/models/user_model.dart';
import 'package:client/product/provider/user_provider.dart';
import 'package:client/view/authenticate/auth/view/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

abstract class AuthenticateModel extends State<Authenticate> {
  UserProvider? provider;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      provider = Provider.of<UserProvider>(context, listen: false);

      provider?.getToken();
    });

    print('Widgets çalıştı');
  }

  parseTokenToUser() {
    //Do Something
  }
  @override
  void dispose() {
    super.dispose();
  }
}
