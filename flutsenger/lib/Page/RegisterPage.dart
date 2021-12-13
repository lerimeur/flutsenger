import 'dart:developer';

import 'package:flutsenger/Api/ApiRequest.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  var obscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: usernameControler,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                TextField(
                  obscureText: obscure,
                  controller: passwordControler,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    log("test");
                    createUser(usernameControler.text, passwordControler.text);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HomePage(

                    //     ),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
