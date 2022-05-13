import 'dart:developer';

import 'package:chat/components/primary_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chat/Api/Apirequest.dart';
import 'package:chat/Screens/chats/chats_screen.dart';
import 'package:chat/components/GotoSignIn.dart';
import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/models/Chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            Spacer(
              flex: 3,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Username",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(controller: _username),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Password",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(controller: _password),
            Spacer(
              flex: 3,
            ),
            GoToLogin(),
            Spacer(),
            PrimaryButton(
              press: () {
                if (_username.text.length == 0 || _password.text.length == 0)
                  return;
                Register_creation(_username.text, _password.text, context);
              },
              text: "Register",
            ),
            Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Center(child: Text("Register")),
    );
  }
}

Register_creation(
    String username, String password, BuildContext context) async {
  final User? my_user = await createUser(username, password);

  if (my_user != null) {
    inspect(my_user);
    // ignore: todo
    // TODO print UX Value
    global_User = my_user;
    Fluttertoast.showToast(
      msg: "Sign In Sucess",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: kPrimaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatsScreen(),
      ),
    );
  } else {
    Fluttertoast.showToast(
      msg: "Sign In Failure",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: kErrorColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    inspect(my_user);
  }
}
