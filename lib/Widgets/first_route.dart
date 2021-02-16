import 'package:flutter/material.dart';

import 'second_route.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        title: Text(
          'Meoka',
          style: TextStyle(fontSize: 30, fontFamily: "NotoSansJP"),
        ),
        backgroundColor: Colors.deepPurple,
      ),
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
        ),
      ),
    );
  }
}
