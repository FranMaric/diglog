import 'package:flutter/material.dart';

class InputBoolean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue[400],
      decoration: InputDecoration(
        hintText: "A + BC",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.blue[400]),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[400]),
        ),
        //fillColor: Colors.green
      ),
    );
  }
}
