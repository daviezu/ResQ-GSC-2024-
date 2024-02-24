// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:new_resq/components/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactPage extends StatefulWidget {
  const EmergencyContactPage({super.key});

  @override
  State<EmergencyContactPage> createState() => _EmergencyContactPageState();
}

class _EmergencyContactPageState extends State<EmergencyContactPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            children: [
              //* HOSPITAL
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri(scheme: 'tel', path: '113');

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print('Cannot Launch this url');
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(235, 235, 235, 10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            width: 60,
                            height: 60,
                            color: Colors.white,
                            child: Image.asset('image/hospitall.png'),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Text('Hospital',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800))
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              //* FIRE FIGHTER
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri(scheme: 'tel', path: '113');

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print('Cannot Launch this url');
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(209, 81, 81, 10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            width: 60,
                            height: 60,
                            color: Colors.white,
                            child: Image.asset(
                              'image/fireFighter.png',
                              cacheWidth: 50,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Text('FireFighter',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800))
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              //* POLICE STATION
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri(scheme: 'tel', path: '113');

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print('Cannot Launch this url');
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(235, 235, 235, 10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            width: 60,
                            height: 60,
                            color: Colors.white,
                            child: Image.asset(
                              'image/PoliceStation.png',
                              cacheWidth: 45,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Text('Police Station',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800)),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              //* AMBULANCE
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri(scheme: 'tel', path: '113');

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print('Cannot Launch this url');
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(209, 81, 81, 10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            width: 60,
                            height: 60,
                            color: Colors.white,
                            child: Image.asset(
                              'image/Ambulance.png',
                              cacheWidth: 50,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Text('Ambulance',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800)),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              //* NATIONAL SEARCH AND RESCUE AGENCY
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri(scheme: 'tel', path: '113');

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print('Cannot Launch this url');
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(235, 235, 235, 10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            width: 60,
                            height: 60,
                            color: Colors.white,
                            child: Image.asset(
                              'image/Basarnas.png',
                              cacheWidth: 50,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Text('National Search and Rescue Agency',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
