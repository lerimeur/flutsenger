import 'dart:convert';
import 'dart:developer';

import 'package:chat/Screens/CreateConv/CreateConv.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

Future<User?> createUser(String username, String password) async {
  var url = Uri.parse("http://localhost:8080/users");
  try {
    var response = await http.post(
      url,
      body: {"Username": username, "password": password},
    );
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    var tmp = json.decode(response.body);
    // inspect(tmp);

    return User(
      id: tmp['id'],
      username: tmp['Username'],
    );
  } catch (e) {
    inspect(e);
    return null;
  }

  // return User(response.body);
}

Future<User?> logInUser(String username, String password) async {
  var url = Uri.parse("http://localhost:8080/users/${username}/${password}");
  try {
    var response = await http.get(
      url,
    );
    // print('Response status: ${response.status
    var tmp = json.decode(response.body);
    // inspect(tmp);
    return User(
      id: tmp['id'],
      username: tmp['Username'],
    );
  } catch (e) {
    inspect(e);
    return null;
  }

  // return User(response.body);
}

Future<List<Conv>> getAllConv() async {
  if (global_User == null) {
    return [];
  }

  // final username = global_User!.getUsername();

  var url = Uri.parse("http://localhost:8080/conv/${global_User!.id}");
  try {
    var response = await http.get(
      url,
    );
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    final tmp = json.decode(response.body) as List<dynamic>;

    final List<Conv> tmp_conv = [];
    // List<Message> tmp_message = [];

    for (var i = 0; i < tmp.length; i++) {
      // print(tmp[i]);
      List<dynamic> messages_values = tmp[i]['messages'];
      for (var j = 0; j < messages_values.length; j++) {
        // print(messages_values[j]);
        // tmp_message.add(Message(messages_values[j]['data'],
        //     messages_values[j]['createdDate'], messages_values[j]['sender']));
      }

      // print(tmp_message);
      tmp_conv.add(Conv(tmp[i]['title'], tmp[i]['id']));
    }

    // print(tmp_conv);
    return tmp_conv;
  } catch (e) {
    print(e);
    return [];
  }
}

void createConv(String title, String username) async {
  var url = Uri.parse("http://localhost:8080/conv");
  if (global_User == null) return;
  print("GO API");
  try {
    // ignore: unused_local_variable
    var response = await http.post(
      url,
      body: {
        "title": title,
        "creator_user_uuid": global_User?.id,
        "user_username": username,
      },
    );
    // inspect(response);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  } catch (e) {
    inspect(e);
  }
}

createMessage(String text, String? senderId, String Convid) async {
  if (senderId == null) return;

  var url = Uri.parse("http://localhost:8080/message");
  try {
    var response = await http.post(url, body: {
      "conv_uuid": Convid,
      "user_uuid": senderId,
      "data": text,
    });
    inspect(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  } catch (e) {
    inspect(e);
  }
}

Future<List<Message>> getMessageforaConv(String ConvId) async {
  var url = Uri.parse("http://localhost:8080/conv/message/${ConvId}");
  try {
    var response = await http.get(url);
    // inspect(response);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    final tmp = json.decode(response.body);

    List<Message> final_list_message = [];

    for (var item in tmp['messages']) {
      final_list_message.add(
        Message(
          item['data'],
          DateTime.parse(item['createdDate']),
          item['sender'],
        ),
      );
    }

    return final_list_message;
  } catch (e) {
    inspect(e);
  }
  return [];
}
