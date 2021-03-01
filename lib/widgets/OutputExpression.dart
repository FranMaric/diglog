import 'package:diglog/functions/statesToExpression.dart';
import 'package:flutter/material.dart';

class OutputExpression extends StatelessWidget {
  final List<String> varNames;
  final List<int> states;

  OutputExpression({this.varNames, this.states});

  @override
  Widget build(BuildContext context) {
    String expression = statesToExpression(states, varNames);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white70,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(10.0),
      child: Text(
        "Minimized: " + expression,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
