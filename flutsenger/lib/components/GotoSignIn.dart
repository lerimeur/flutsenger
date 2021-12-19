import 'package:chat/Screens/Login/Login.dart';
import 'package:chat/Screens/Register/Register.dart';
import 'package:chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GoToLogin extends StatelessWidget {
  const GoToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: FittedBox(
        child: Row(
          children: [
            Text(
              "if you already got an account click here",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => WelcomeScreen(),
                        builder: (context) => Login(),
                      ),
                    ),
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}

class GoToRegister extends StatelessWidget {
  const GoToRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: FittedBox(
        child: Row(
          children: [
            Text(
              "if you dont have already an account click here",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => WelcomeScreen(),
                        builder: (context) => Register(),
                      ),
                    ),
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
