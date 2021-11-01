import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void loginfunction() async {
  try {
    // ignore: unused_local_variable
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: "barry.allen@example.com", password: "SuperSecretPassword!");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      log('No user found for that email.');
      return;
    } else if (e.code == 'wrong-password') {
      log('Wrong password provided for that user.');
      return;
    }
    inspect(e);
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(height: 100),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: visible,
            decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  visible = !visible;
                }),
                icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () => loginfunction(), child: const Text('Login'))
        ],
      ),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const Text(
//                   'LOGIN',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w900,
//                       fontSize: 60.0,
//                       color: Colors.blue),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: const InputDecoration(
//                     labelText: 'Email Address',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.email),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.lock),
//                     suffixIcon: Icon(Icons.remove_red_eye),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         print('Forgotted Password!');
//                       },
//                       child: Text(
//                         'Forgot Password?',
//                         style: TextStyle(
//                           color: Colors.black.withOpacity(0.4),
//                           fontSize: 12.0,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   width: double.infinity,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                   ),
//                   child: MaterialButton(
//                     onPressed: () => print("Successul Login."),
//                     color: Colors.blue,
//                     child: const Text(
//                       'LOGIN',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 const Divider(
//                   color: Colors.black,
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '''Don't have an account? ''',
//                       style: TextStyle(
//                         color: Colors.black.withOpacity(0.5),
//                         fontSize: 16.0,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         log('Sign Up');
//                       },
//                       child: const Text('Register Now'),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
