// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_resq/page/EmergencyContact.dart';
import 'package:new_resq/page/HistoryLaporan.dart';
import 'package:new_resq/page/HomePage.dart';
import 'package:new_resq/page/LaporanKejadian.dart';
import 'package:new_resq/weahter1.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  User? user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.report_gmailerrorred),
            title: Text('Report'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LaporanPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryLaporan()));
            },
          ),
          ListTile(
            leading: Icon(Icons.emergency),
            title: Text('Emergency Contact'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmergencyContactPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud),
            title: Text('Weather'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WeatherApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text('Log Out'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
