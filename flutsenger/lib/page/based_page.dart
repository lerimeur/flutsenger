import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login_page.dart';

class BasedApp extends StatefulWidget {
  const BasedApp({Key? key}) : super(key: key);

  @override
  _BasedAppState createState() => _BasedAppState();
}

class _BasedAppState extends State<BasedApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasedApp'),
      ),
      body: const LoginScreen(),
    );
  }
}
