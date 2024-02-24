// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:new_resq/page/SignIn.dart';
import 'package:new_resq/page/SignUp.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignIn(showSignUpPage: toggleScreen);
    } else {
      return SignUp(showLoginPage: toggleScreen);
    }
  }
}
