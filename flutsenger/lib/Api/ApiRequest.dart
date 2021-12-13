import 'package:http/http.dart' as http;

createUser(String username, String password) async {
  var url = Uri.parse("http://localhost:8080/users");

  var response = await http.post(
    url,
    body: {"Username": username, "password": password},
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
