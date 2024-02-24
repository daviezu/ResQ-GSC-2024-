// ignore_for_file: prefer_const_constructors, use_super_parameters, file_names, use_build_context_synchronously, avoid_print, empty_statements

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_resq/components/button.dart';
import 'package:new_resq/components/textField.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUp({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool isChecked = false;
  bool _obsureText = true;

  Future<void> signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog(context, 'Email and password cannot be empty');
      return;
    }

    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _showErrorDialog(context, 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          _showErrorDialog(
              context, 'The account already exists for that email.');
        } else {
          _showErrorDialog(context, 'Error: ${e.message}');
        }
      } catch (e) {
        print('Unexpected error: $e');
      }
    } else {
      _showErrorDialog(context, 'Passwords do not match');
    }
    ;
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

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* GAMBAR APLIKASI
          Image.asset('image/splash.png', width: 150),

          const SizedBox(height: 20),

          //* KATA SAMBUTAN
          Text(
            'Get Started With Your Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
            ),
          ),

          const SizedBox(height: 20),

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

          const SizedBox(height: 10),

          MyTextField(
            onTap: () {
              setState(() {
                _obsureText = !_obsureText;
              });
            },
            height: 80,
            width: 340,
            controller: _confirmPasswordController,
            labelText: 'Confirm Password',
            hintText: 'Enter Your Password Again',
            obsureText: _obsureText,
            visibleIcon: true,
            maxLength: 100,
            maxLines: 1,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue!;
                  });
                },
              ),
              Text(
                'I Agree To Terms of Service & Privacy',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 40),

          MyButton(
            onTap: isChecked
                ? () {
                    signUp();
                  }
                : null,
            text: 'Confirm',
          ),

          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already Have An Account? ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: widget.showLoginPage,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.blue[600],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
