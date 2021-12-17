import 'dart:developer';

import 'package:flutsenger/Composant/ScrollConv.dart';
import 'package:flutsenger/Composant/SearchAppBar.dart';
import 'package:flutsenger/type/type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ConvTitle> convtitle = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        backgroundC: Colors.black,
        iconButton: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            log("add a conversation");
          },
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData || convtitle.length != 0) {
            return ScrollConv(
              convTitles: convtitle,
            );
          }
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final tmp1 =
              ConvTitle("Conversation 1", "assets/images/user.png", "Bonjour1");
          final tmp2 =
              ConvTitle("Conversation 2", "assets/images/user.png", "Bonjour2");
          final tmp3 =
              ConvTitle("Conversation 3", "assets/images/user.png", "Bonjour3");
          final tmp4 =
              ConvTitle("Conversation 4", "assets/images/user.png", "Bonjour4");
          final tmp5 =
              ConvTitle("Conversation 5", "assets/images/user.png", "Bonjour5");
          convtitle.add(tmp1);
          convtitle.add(tmp2);
          convtitle.add(tmp3);
          convtitle.add(tmp4);
          convtitle.add(tmp5);
          return const Center(
            child: Text("No data"),
          );
        },
        future: Future.delayed(
          const Duration(seconds: 2),
        ),
      ),
    );
  }
}
