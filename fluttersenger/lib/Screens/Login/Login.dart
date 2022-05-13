import 'dart:developer';

import 'package:chat/Api/Apirequest.dart';
import 'package:chat/Screens/chats/chats_screen.dart';
import 'package:chat/components/GotoSignIn.dart';
import 'package:chat/components/filled_outline_button.dart';
import 'package:chat/components/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

import '../../constants.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool? stay = false;

  final db = Localstore.instance;

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
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(controller: _username),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Password",
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(controller: _password),
            Spacer(
              flex: 3,
            ),
            Row(
              children: [
                Checkbox(
                  value: stay,
                  onChanged: (bool? value) {
                    setState(() {
                      stay = value!;
                    });
                  },
                ),
                Text('Stay logged in'),
              ],
            ),
            GoToRegister(),
            Spacer(),
            PrimaryButton(
              press: () {
                if (_username.text.length == 0 || _password.text.length == 0) return;
                // Login_usage(_username.text, _password.text, context);
                db.collection('user').doc('0').set(
                  {'username': _username.text, 'password': _password.text},
                );
                final user = db.collection('user').doc('0');
                inspect(user);
              },
              text: "Login",
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
      title: Center(child: Text("Sign In")),
    );
  }
}

Login_usage(String username, String password, BuildContext context) async {
  final User? my_user = await logInUser(username, password);

  inspect(my_user);
  if (my_user != null) {
    // inspect(my_user);
    // ignore: todo
    // TODO print UX Value
    global_User = my_user;
    // Fluttertoast.showToast(
    //   msg: "Sign In Sucess",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.CENTER,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: kPrimaryColor,
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatsScreen(),
      ),
    );
  } else {
    // Fluttertoast.showToast(
    //   msg: "Sign In Failure",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.CENTER,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: kErrorColor,
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );
  }
}
