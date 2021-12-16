import 'dart:developer';

import 'package:flutsenger/Composant/SearchAppBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        backgroundC: Colors.black,
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
