import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController customcontroler;

  final bool obs;
  MyTextField({Key key, this.customcontroler, this.obs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obs,
      controller: customcontroler,
      textInputAction: TextInputAction.done,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: obs == true ? 'Password' : 'Username',
        focusColor: Color(0xFFfbeeac),
        fillColor: Color(0xFF8ac4d0),
      ),
    );
  }
}
