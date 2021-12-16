import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

Future<User?> createUser(String username, String password) async {
  var url = Uri.parse("http://localhost:8080/users");
  try {
    var response = await http.post(
      url,
      body: {"Username": username, "password": password},
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var tmp = json.decode(response.body);
    inspect(tmp);
    return User(
      id: tmp['id'],
      username: tmp['username'],
    );
  } catch (e) {
    inspect(e);
    return null;
  }

  // return User(response.body);
}

class User {
  final int id;
  final String username;

  User({required this.id, required this.username});
}
