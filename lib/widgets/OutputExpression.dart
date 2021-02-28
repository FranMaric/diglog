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
      child: Text(
        expression,
      ),
    );
  }
}
