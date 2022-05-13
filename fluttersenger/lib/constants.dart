import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF00BF6D);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

User? global_User;

class User {
  final String id;
  final String username;

  User({required this.id, required this.username});
  getUsername() => username;
}

class Message {
  final String mess;
  final DateTime createdDate;
  final String sender;

  Message(this.mess, this.createdDate, this.sender);

  @override
  bool operator ==(other) {
    return (other is Message) && other.mess == mess && other.createdDate == createdDate && other.sender == sender;
  }
}

class Conv {
  final String id;
  final String title;
  // final List<Message> messages;

  Conv(
    this.title,
    this.id,
  );
}
