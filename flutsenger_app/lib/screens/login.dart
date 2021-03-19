import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/styles.dart';
import 'package:flutsenger_app/component/textfiled.dart';

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
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Container(
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
                    Container(height: 150),
                    Text(
                      'Login',
                      style: headLine,
                    ),
                    Container(height: 100),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: MyTextField(customcontroler: usernameController, obs: false),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: MyTextField(
                        obs: true,
                        customcontroler: passwordController,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () => print(
                        'une fonction styler a ete mis en com dsl ${usernameController.text}',
                      ), //widget.onLogin(usernameController.text, passwordController.text),
                      child: Text(
                        'Submit',
                        style: kSubtitleStyle,
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ),
            )));
  }
}
