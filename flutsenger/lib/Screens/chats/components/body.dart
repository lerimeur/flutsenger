import 'dart:async';
import 'dart:developer';

import 'package:chat/Api/Apirequest.dart';
import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/Chat.dart';
import 'package:flutter/material.dart';

import 'chat_card.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Conv> my_Conv = [];

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => refresh());
  }

  refresh() {
    log("refresh");
    getAllConv().then(
      (value) => setState(
        () {
          my_Conv = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (my_Conv.isNotEmpty) {
      return ListView.builder(
        itemCount: my_Conv.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(my_Conv[index].title),
          );
        },
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
