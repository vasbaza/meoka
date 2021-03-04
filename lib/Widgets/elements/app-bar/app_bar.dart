import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Meoka",
        style: TextStyle(fontSize: 30, fontFamily: "NotoSansJP"),
      ),
      backgroundColor: Colors.deepPurple,
    );
  }
}
