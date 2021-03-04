import 'package:flutter/material.dart';

import '../elements/app-bar/app_bar.dart';
import 'second_route.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(),
        body: Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple, // background
            // onPrimary: Colors.deepPurple, // foreground
          ),
          child: Text(
            'How are you?',
            style: TextStyle(fontSize: 24, fontFamily: "NotoSansJP"),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        )));
  }
}
