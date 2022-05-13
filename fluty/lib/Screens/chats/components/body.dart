import 'dart:async';
import 'dart:developer';

import 'package:chat/Api/Apirequest.dart';
import 'package:chat/Screens/Message/message_screen.dart';
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
    refresh();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => refresh());
  }

  refresh() {
    print("refresh");
    getAllConv().then(
      //todo check si il y a des diff et sinon go faire une autre maniere de fetch les messages
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
          return ChatCard(
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MessagesScreen(
                  conv: my_Conv[index],
                ),
              ),
            ),
            conv: my_Conv[index],
          );
          // title: Text(my_Conv[index].title),
        },
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
