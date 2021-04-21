import 'package:flutter/material.dart';

void goOn(Widget value, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => value));
}
