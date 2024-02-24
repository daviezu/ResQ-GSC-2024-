// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        width: 240,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
