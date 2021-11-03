import 'dart:developer';

import 'package:flutsenger/page/based_page.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

// Import the firebase_core plugin

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;
  late FirebaseApp Myapp;
  void initializeFlutterFire() async {
    try {
      Myapp = await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      log('Error');
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return const CircularProgressIndicator();
    }

    return BasedApp(myapp: Myapp);
  }
}


// class App extends StatefulWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initialization,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           log('err');
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           var currentUser = FirebaseAuth.instance.currentUser;

//           if (currentUser != null) {
//             Fluttertoast.showToast(
//                 msg: "Login Success",
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.BOTTOM,
//                 timeInSecForIosWeb: 2,
//                 backgroundColor: Colors.green,
//                 textColor: Colors.white,
//                 fontSize: 18.0);
//             return BasedApp(snapshot.);
//           } else {
//             return const LoginScreen();
//           }
//         }

//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }
