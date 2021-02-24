import 'package:flutter/material.dart';

//Functions
import 'package:diglog/functions/expressionToStates.dart';
import 'package:diglog/functions/varNamesFromExpression.dart';

class InputExpression extends StatelessWidget {
  final Function changeState;
  final Function submitState;
  final String valid;

  InputExpression({this.changeState, this.submitState, this.valid});

  void handleChange(String expression) {
    changeState(expressionToStates(expression),
        varNamesFromExpression(expression), expression);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: handleChange,
      onSubmitted: submitState,
      cursorColor: Colors.blue[400],
      decoration: InputDecoration(
        hintText: "A + B*C",
        errorText: valid,
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
