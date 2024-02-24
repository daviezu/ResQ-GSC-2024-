// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_resq/components/auth_page.dart';
import 'package:new_resq/components/email_validation.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key ? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return VerifyEmailPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}