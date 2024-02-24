// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, file_names, avoid_print, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_resq/components/button.dart';
import 'package:new_resq/components/navbar.dart';
import 'package:new_resq/components/textField.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class UserData {
  String email;
  final String report;
  final String description;
  final String location;

  UserData({
    required this.email,
    required this.report,
    required this.description,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
        'email': email.toString(),
        'report': report,
        'description': description,
        'location': location
      };

  static UserData fromJson(Map<String, dynamic> json) => UserData(
        email: json['email'],
        report: json['report'],
        description: json['description'],
        location: json['location'],
      );
}

class _LaporanPageState extends State<LaporanPage> {
  final _reportController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();

  Future<void> LaporanData(UserData userData) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final collectionReference =
          FirebaseFirestore.instance.collection('users');

      final newDocumentReference = await collectionReference.add({
        'email': user.email,
        'report': userData.report,
        'description': userData.description,
        'location': userData.location,
      });
      print('Document added with ID: ${newDocumentReference.id}');
    } else {
      print('User not authenticated');
    }
  }

  Future<List<UserData>> getAllUserData(String userEmail) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .get();

    return querySnapshot.docs
        .map((doc) => UserData.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* KATA SAMBUTAN
                Text(
                  'Hello ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Do you mind telling us what do you want to report',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 10),

                Divider(
                  height: 1,
                ),

                const SizedBox(height: 20),

                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),

                      //* REPORT
                      MyTextField(
                        onTap: () {},
                        height: 80,
                        width: 340,
                        controller: _reportController,
                        labelText: 'Report',
                        hintText: 'Report',
                        obsureText: false,
                        visibleIcon: false,
                        maxLength: 100,
                        maxLines: 10,
                      ),

                      const SizedBox(height: 20),

                      //* DESCRIPTION
                      MyTextField(
                        onTap: () {},
                        height: 200,
                        width: 340,
                        controller: _descriptionController,
                        labelText: 'Description',
                        hintText: 'Description',
                        obsureText: false,
                        visibleIcon: false,
                        maxLength: 1000,
                        maxLines: 100,
                      ),

                      const SizedBox(height: 20),

                      //* LOCATION
                      MyTextField(
                        onTap: () {},
                        height: 80,
                        width: 340,
                        controller: _locationController,
                        labelText: 'Location',
                        hintText: 'Location',
                        obsureText: false,
                        visibleIcon: false,
                        maxLength: 100,
                        maxLines: 10,
                      ),

                      const SizedBox(height: 20),

                      //* SUBMIT
                      MyButton(
                        onTap: () async {
                          final user = UserData(
                              email: '',
                              report: _reportController.text,
                              description: _descriptionController.text,
                              location: _locationController.text);
                          await LaporanData(user);
                        },
                        text: 'Report Now',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
