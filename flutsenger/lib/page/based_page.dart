import 'dart:developer';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasedApp extends StatefulWidget {
  final FirebaseApp myapp;
  const BasedApp({Key? key, required this.myapp}) : super(key: key);

  @override
  _BasedAppState createState() => _BasedAppState();
}

class _BasedAppState extends State<BasedApp> {
  late DatabaseReference _messagesRef;

  @override
  void initState() {
    super.initState();

    _messagesRef = FirebaseDatabase.instance.reference().child('conv');
    // inspect(_messagesRef);
    inspect(widget.myapp);
    final FirebaseDatabase database = FirebaseDatabase(app: widget.myapp);
    // database.reference().child('conv').get().then((value) => inspect(value));
    // inspect(_messagesRef);

    // database.reference().child('conv').get().then((DataSnapshot snapshot) {
    //   inspect(snapshot.value);
    // });
    // Demonstrates configuring the database directly
    //
    // // _messagesRef = database.reference().child('messages');
    // database.reference().child('users').get().then(
    //   (DataSnapshot? snapshot) {
    //     // ignore: avoid_print
    //     print(
    //         'Connected to directly configured database and read ${snapshot!.value}');
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasedApp'),
      ),
      body: const Text('data'),
    );
  }
}

// // ignore_for_file: require_trailing_commas
// // Copyright 2019 The Chromium Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final FirebaseApp app = await Firebase.initializeApp();
//   runApp(MaterialApp(
//     title: 'Flutter Database Example',
//     home: MyHomePage(app: app),
//   ));
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.app}) : super(key: key);

//   final FirebaseApp app;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   late DatabaseReference _counterRef;
//   late DatabaseReference _messagesRef;
//   late StreamSubscription<Event> _counterSubscription;
//   late StreamSubscription<Event> _messagesSubscription;
//   bool _anchorToBottom = false;

//   String _kTestKey = 'Hello';
//   String _kTestValue = 'world!';
//   DatabaseError? _error;

//   @override
//   void initState() {
//     super.initState();
//     // Demonstrates configuring to the database using a file
//     _counterRef = FirebaseDatabase.instance.reference().child('counter');
//     // Demonstrates configuring the database directly
//     final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
//     _messagesRef = database.reference().child('messages');
//     database.reference().child('counter').get().then((DataSnapshot? snapshot) {
//       print(
//           'Connected to directly configured database and read ${snapshot!.value}');
//     });

//     database.setLoggingEnabled(true);

//     if (!kIsWeb) {
//       database.setPersistenceEnabled(true);
//       database.setPersistenceCacheSizeBytes(10000000);
//       _counterRef.keepSynced(true);
//     }
//     _counterSubscription = _counterRef.onValue.listen((Event event) {
//       setState(() {
//         _error = null;
//         _counter = event.snapshot.value ?? 0;
//       });
//     }, onError: (Object o) {
//       final DatabaseError error = o as DatabaseError;
//       setState(() {
//         _error = error;
//       });
//     });
//     _messagesSubscription =
//         _messagesRef.limitToLast(10).onChildAdded.listen((Event event) {
//       print('Child added: ${event.snapshot.value}');
//     }, onError: (Object o) {
//       final DatabaseError error = o as DatabaseError;
//       print('Error: ${error.code} ${error.message}');
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _messagesSubscription.cancel();
//     _counterSubscription.cancel();
//   }

//   Future<void> _increment() async {
//     await _counterRef.set(ServerValue.increment(1));

//     await _messagesRef
//         .push()
//         .set(<String, String>{_kTestKey: '$_kTestValue $_counter'});
//   }

//   Future<void> _incrementAsTransaction() async {
//     // Increment counter in transaction.
//     final TransactionResult transactionResult =
//         await _counterRef.runTransaction((MutableData mutableData) {
//       mutableData.value = (mutableData.value ?? 0) + 1;
//       return mutableData;
//     });

//     if (transactionResult.committed) {
//       await _messagesRef.push().set(<String, String>{
//         _kTestKey: '$_kTestValue ${transactionResult.dataSnapshot?.value}'
//       });
//     } else {
//       print('Transaction not committed.');
//       if (transactionResult.error != null) {
//         print(transactionResult.error!.message);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Database Example'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             child: Center(
//               child: _error == null
//                   ? Text(
//                       'Button tapped $_counter time${_counter == 1 ? '' : 's'}.\n\n'
//                       'This includes all devices, ever.',
//                     )
//                   : Text(
//                       'Error retrieving button tap count:\n${_error!.message}',
//                     ),
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 await _incrementAsTransaction();
//               },
//               child: const Text('Increment as transaction')),
//           ListTile(
//             leading: Checkbox(
//               onChanged: (bool? value) {
//                 if (value != null) {
//                   setState(() {
//                     _anchorToBottom = value;
//                   });
//                 }
//               },
//               value: _anchorToBottom,
//             ),
//             title: const Text('Anchor to bottom'),
//           ),
//           Flexible(
//             child: FirebaseAnimatedList(
//               key: ValueKey<bool>(_anchorToBottom),
//               query: _messagesRef,
//               reverse: _anchorToBottom,
//               itemBuilder: (BuildContext context, DataSnapshot snapshot,
//                   Animation<double> animation, int index) {
//                 return SizeTransition(
//                   sizeFactor: animation,
//                   child: ListTile(
//                     trailing: IconButton(
//                       onPressed: () =>
//                           _messagesRef.child(snapshot.key!).remove(),
//                       icon: const Icon(Icons.delete),
//                     ),
//                     title: Text(
//                       '$index: ${snapshot.value.toString()}',
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _increment,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
