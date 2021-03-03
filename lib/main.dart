import 'package:flutter/material.dart';
import 'namesearch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutsenger',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Discussions"),
              leading: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg'),
                    radius: 50,
                  )),
            ),
            body: Center(child: Conversations())));
  }
}
