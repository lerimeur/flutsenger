import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/styles.dart';
import 'package:flutsenger_app/component/textfiled.dart';
import '../component/Button.dart';

class LoginPage extends StatefulWidget {
  // final onLogin;

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF4C97DE),
                Color(0xFF3D7BB5),
                Color(0xFF316494),
                Color(0xFF28527A),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                SizedBox(height: 150),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Text(
                    'Login',
                    style: headLine,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: MyTextField(customcontroler: usernameController, obs: false),
                ),
                SizedBox(height: 10),
                Flexible(
                  flex: 1,
                  child: MyTextField(
                    obs: true,
                    customcontroler: passwordController,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: MyElevatedButton(
                    text: 'Submit',
                    triger: () => print('hello world'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
        ));
  }
}
