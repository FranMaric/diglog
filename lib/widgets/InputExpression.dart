import 'package:flutter/material.dart';

//Provider
import 'package:provider/provider.dart';
import 'package:diglog/appState.dart';

class InputExpression extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Provider.of<AppState>(context).controller,
      onChanged: (e) =>
          Provider.of<AppState>(context, listen: false).setExpression(e),
      onSubmitted: (e) =>
          Provider.of<AppState>(context, listen: false).submitStates(),
      cursorColor: Colors.blue[400],
      decoration: InputDecoration(
        hintText: "A + B * not C",
        errorText: Provider.of<AppState>(context).valid,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[400]),
        ),
      ),
    );
  }
}
