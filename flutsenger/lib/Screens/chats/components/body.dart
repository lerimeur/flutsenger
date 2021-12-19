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
  List<Conv>? my_Conv;

  // @override
  // void initState() {
  //   super.initState();
  //   if (my_Conv == null) {
  //     setState(() {
  //       my_Conv = getAllConv();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllConv(),
      builder: (context, AsyncSnapshot<List<Conv>> snapshot) {
        if (snapshot.hasData) {
          my_Conv = snapshot.data;

          inspect(my_Conv);
        }
        if (snapshot.hasError) {
          inspect(snapshot.error);
          return Text("snap got an error");
        }
        if (my_Conv != null && my_Conv!.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].title),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
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
