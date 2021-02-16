import 'package:flutter/material.dart';

import 'Widgets/auth.dart';
import 'Widgets/first_route.dart';
import 'Widgets/second_route.dart';

void main() => runApp(MeokaApp());

class MeokaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignUpScreen(),
        '/firstRoute': (context) => FirstRoute(),
        '/secondRoute': (context) => SecondRoute(),
      },
    );
  }
}
