import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Widgets/elements/firebase/error.dart';
import 'Widgets/elements/firebase/loading.dart';
import 'Widgets/pages/first_route.dart';
import 'Widgets/pages/second_route.dart';
import 'Widgets/pages/sign_up.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeokaApp());
}

class MeokaApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Meoka',
              style: TextStyle(fontSize: 30, fontFamily: "NotoSansJP"),
            ),
            backgroundColor: Colors.deepPurple,
          ),
          body: FutureBuilder(
            // Initialize FlutterFire:
            future: _initialization,
            builder: (context, snapshot) {
              // Check for errors
              if (snapshot.hasError) {
                return FirebaseIniError();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                    child: SizedBox(
                        width: 400,
                        child: Card(
                          child: SignUpForm(),
                        )));
              }
              return Loader();
            },
          )),
      routes: {
        // '/': (context) => SignUpScreen(),
        '/firstRoute': (context) => FirstRoute(),
        '/secondRoute': (context) => SecondRoute(),
      },
    );
  }
}
