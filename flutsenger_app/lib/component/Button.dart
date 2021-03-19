import 'package:flutter/material.dart';
import '../utilities/styles.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final Function triger;
  const MyElevatedButton({Key key, this.text, this.triger}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      child: Text(
        text,
        style: kSubtitleStyle,
      ),
      onPressed: triger,
    ));
  }
}
