// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable, prefer_interpolation_to_compose_strings, unnecessary_cast, avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_resq/components/navbar.dart';
import 'package:new_resq/page/LaporanKejadian.dart';

class HistoryLaporan extends StatefulWidget {
  const HistoryLaporan({super.key});

  @override
  State<HistoryLaporan> createState() => _HistoryLaporanState();
}

class _HistoryLaporanState extends State<HistoryLaporan> {
  Future<List<UserData>> readAllUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();

      return querySnapshot.docs
          .map((doc) => UserData.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } else {
      print('User not authenticated');
      return [];
    }
  }

  Widget buildUser(UserData user) {
    return Column(
      children: [
        ListTile(title: Text('Report: ' + user.report)),
        ListTile(title: Text('Description: ' + user.description)),
        ListTile(title: Text('location: ' + user.location)),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
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
                ]),
          ),
        ),
        body: FutureBuilder<List<UserData>>(
          future: readAllUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text('No Report', style: TextStyle(fontSize: 40)));
            } else {
              final List<UserData> userDataList = snapshot.data!;
              return ListView.builder(
                itemCount: userDataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Report: ${userDataList[index].report}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description: ${userDataList[index].description}'),
                        Text('Location: ${userDataList[index].location}'),
                        Divider(height: 2),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
