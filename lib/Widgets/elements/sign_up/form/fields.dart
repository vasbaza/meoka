import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String _fieldText;
  final TextEditingController _controller;

  Field(String text, TextEditingController controller)
      : _fieldText = text,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: _controller,
        decoration: InputDecoration(
          hintText: this._fieldText,
          hintStyle: TextStyle(fontSize: 17, fontFamily: "NotoSansJP"),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
