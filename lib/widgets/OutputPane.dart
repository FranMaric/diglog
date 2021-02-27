import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/OutputKTable.dart';
import 'package:diglog/widgets/OutputMyTable.dart';
import 'package:diglog/widgets/OutputExpression.dart';

class OutputPane extends StatelessWidget {
  final List<String> varNames;
  final List<int> states;

  OutputPane({this.varNames, this.states});

  @override
  Widget build(BuildContext context) {
    if (varNames == null || states == null) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutputExpression(
            states: states,
            varNames: varNames,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutputKTable(
            states: states,
            varNames: varNames,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutputMyTable(
            states: states,
            varNames: varNames,
          ),
        ),
      ],
    );
  }
}
