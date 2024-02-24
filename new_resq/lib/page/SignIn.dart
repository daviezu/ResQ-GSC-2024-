// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_constructors_in_immutables, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_resq/components/button.dart';
import 'package:new_resq/components/textField.dart';

class SignIn extends StatefulWidget {
  final VoidCallback showSignUpPage;
  SignIn({super.key, required this.showSignUpPage});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obsureText = true;

  Future<void> login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog(context, 'Email and password cannot be empty');
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        _showErrorDialog(context, 'Invalid email or password');
      } else {
        _showErrorDialog(context, 'Invalid email or password');
      }
    } catch (e) {
      _showErrorDialog(context, 'Error: $e');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            GestureDetector(
              child: Text('OK'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //* GAMBAR APLIKASI
                Image.asset('image/splash.png', width: 150),

                const SizedBox(height: 20),

                //* KATA SAMBUTAN
                Text(
                  'Log Into Your Account',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Poppins',
                  ),
                ),

                const SizedBox(height: 20),

                //* INPUT EMAIL
                MyTextField(
                  onTap: () {},
                  height: 80,
                  width: 340,
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                  obsureText: false,
                  visibleIcon: false,
                  maxLength: 100,
                  maxLines: 1,
                ),

                const SizedBox(height: 10),

                //* INPUT PASSWORD
                MyTextField(
                  onTap: () {
                    setState(() {
                      _obsureText = !_obsureText;
                    });
                  },
                  height: 80,
                  width: 340,
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  obsureText: _obsureText,
                  visibleIcon: true,
                  maxLength: 100,
                  maxLines: 1,
                ),

                const SizedBox(height: 40),

                //* TOMBOL LOGIN
                MyButton(
                  onTap: login,
                  text: 'Log In',
                ),

                const SizedBox(height: 20),

                //* BUAT AKUN
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t Have An Account? ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                        )),
                    GestureDetector(
                      onTap: widget.showSignUpPage,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          // fontFamily: 'Inter',
                          // fontSize: 14,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
