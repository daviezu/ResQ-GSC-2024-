// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously, use_super_parameters, non_constant_identifier_names, override_on_non_overriding_member

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_resq/components/navbar.dart';

class AppBarPage extends StatelessWidget implements PreferredSize {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  Size get PreferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea(
        drawer: NavBar(),
        appBar: AppBar(
          centerTitle: true,
          title: RichText(
            text: TextSpan(
                style: TextStyle(
                  fontFamily: 'EmblemaOne',
                  fontSize: 25,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Res',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Q',
                    style: TextStyle(color: Colors.red[800]),
                  )
                ]),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                // await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      // ),
    );
  }
  
  @override
  Widget get child => throw UnimplementedError();
  
  @override
  Size get preferredSize => const Size(
    double.maxFinite,
    80,
  );
}
