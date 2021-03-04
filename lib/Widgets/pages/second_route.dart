import 'package:flutter/material.dart';

import '../elements/app-bar/app_bar.dart';

class SecondRoute extends StatelessWidget {
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
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Bye!',
            style: TextStyle(fontSize: 24, fontFamily: "NotoSansJP"),
          ),
        ),
      ),
    );
  }
}
