import 'dart:developer';

import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/Chat.dart';
import 'package:flutter/material.dart';

import 'chat_card.dart';

class Message {
  final String title;
  final String name_of;

  Message(this.title, this.name_of);
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Message> my_Conv = [];
  @override
  void initState() {
    super.initState();
    my_Conv.add(Message("test1", "null"));
    my_Conv.add(Message("test2", "null"));
    my_Conv.add(Message("test3", "null"));
    my_Conv.add(Message("test4", "null"));
  }

  @override
  Widget build(BuildContext context) {
    return Text("data");
    // return ListView.builder(
    //   itemCount: chatsData.length,
    //   itemBuilder: (context, index) => ChatCard(
    //     chat: chatsData[index],
    //     press: () => log("chat card"),
    //     // press: () => Navigator.push(
    //     //   context,
    //     //   MaterialPageRoute(
    //     //     builder: (context) => MessagesScreen(),
    //     //   ),
    //     // ),
    //   ),
    // );
  }
}
