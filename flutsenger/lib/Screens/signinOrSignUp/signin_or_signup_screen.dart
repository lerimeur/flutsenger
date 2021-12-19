import 'dart:developer';

import 'package:chat/Screens/Login/Login.dart';
import 'package:chat/Screens/Register/Register.dart';
import 'package:chat/Screens/chats/chats_screen.dart';
import 'package:chat/Screens/welcome/welcome_screen.dart';
import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

class SigninOrSignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                "assets/images/flutter_logo.png",
                height: 146,
              ),
              Spacer(),
              PrimaryButton(
                text: "Login",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => WelcomeScreen(),
                    builder: (context) => Login(),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Register",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
