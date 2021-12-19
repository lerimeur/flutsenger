import 'dart:convert';
import 'dart:developer';

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
  var url = Uri.parse("http://localhost:8080/users/${username}");
  try {
    var response = await http.get(
      url,
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

Future<List<Conv>> getAllConv() async {
  if (global_User == null) {
    return [];
  }

  final username = global_User!.getUsername();

  var url = Uri.parse("http://localhost:8080/users/${username}");
  try {
    var response = await http.get(
      url,
    );
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    var tmp = json.decode(response.body);
    // inspect(tmp);
    // inspect(tmp['conv']);
    return tmp['conv']
        .map<Conv>((conv) => Conv(conv['title'], conv['id']))
        .toList();
  } catch (e) {
    inspect(e);
    return [];
  }

  // return User(response.body);
}
