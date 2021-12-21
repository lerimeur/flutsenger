import 'dart:async';
import 'dart:developer';

import 'package:chat/Api/Apirequest.dart';
import 'package:chat/Screens/Message/textInputchat.dart';
import 'package:chat/Screens/Message/text_message.dart';
import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

// import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  final Conv conv;

  const MessagesScreen({Key? key, required this.conv}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  // Timer? timer;

  List<Message> message_list = [];

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    refresh();
    // timer = Timer.periodic(Duration(seconds: 2), (Timer t) => refresh());
  }

  refresh() {
    getMessageforaConv(widget.conv.id)
        .then((value) => setState(() => {message_list = value}));
  }

  @override
  Widget build(BuildContext context) {
    // inspect(message_list);
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: listMessage(),
            ),
          ),
          ChatInputField(widget.conv, fct: refresh),
        ],
      ),
    );
  }

  Widget listMessage() {
    if (message_list.isEmpty) return CircularProgressIndicator();
    return ListView.builder(
      itemCount: message_list.length,
      itemBuilder: (context, index) {
        final _sender = message_list[index].sender == global_User!.id;
        return Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding),
          child: Row(
            mainAxisAlignment:
                _sender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!_sender) ...[
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage("assets/images/user_2.png"),
                ),
                SizedBox(width: kDefaultPadding / 2),
              ],
              TextMessage(message: message_list[index].mess, sender: _sender)

              // if (_sender)
              // MessageStatusDot(status: message.messageStatus)
            ],
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.conv.title,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
