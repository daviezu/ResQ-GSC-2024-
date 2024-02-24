// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Function() onTap;
  final controller;
  final double width;
  final double height;
  final int maxLength;
  final int maxLines;
  final String labelText;
  final String hintText;
  final bool obsureText;
  final bool visibleIcon;

  MyTextField({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.maxLength,
    required this.maxLines,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.obsureText,
    required this.visibleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controller,
          obscureText: obsureText,
          maxLength: maxLength,
          maxLines: maxLines,
          decoration: InputDecoration(
              suffixIcon: visibleIcon
                  ? GestureDetector(
                      onTap: onTap, child: Icon(Icons.remove_red_eye))
                  : null,
              labelText: labelText,
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    );
  }
}
