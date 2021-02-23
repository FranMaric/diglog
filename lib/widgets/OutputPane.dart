import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/OutputKTable.dart';
import 'package:diglog/widgets/OutputMyTable.dart';
import 'package:diglog/widgets/OutputBoolean.dart';

class OutputPane extends StatelessWidget {
  final List<String> variableNames;
  final List<int> states;

  OutputPane({this.variableNames, this.states});

  @override
  Widget build(BuildContext context) {
    if (variableNames == null || states == null) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutputBoolean(
            states: states,
            variableNames: variableNames,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutputKTable(
            states: states,
            variableNames: variableNames,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutputMyTable(
            states: states,
            variableNames: variableNames,
          ),
        ),
      ],
    );
  }
}
