// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously, use_super_parameters, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_resq/components/customListTile.dart';
import 'package:new_resq/components/navbar.dart';
import 'package:new_resq/model/article_model.dart';
import 'package:new_resq/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  User? user;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? newUser) {
      setState(() {
        user = newUser;
      });
    });
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
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          // periksa apakah kita menerima respon atau tidak
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            // bikin list articles
            List<Article>? articles = snapshot.data;

            return ListView.builder(

                // bikin custom create Listtile
                itemCount: articles?.length,
                itemBuilder: (context, index) {
                  if (articles != null && articles[index] != null) {
                    return customListTile(articles[index], context);
                  } else {
                    return SizedBox.shrink();
                  }
                });
            // return Center(
            //   child: Text("Success !"),
            // );
          }

          return Center(
            // child: CircularProgressIndircator(),
            child: Text("Error"),
          );
        },
      ),
    );
  }
}
