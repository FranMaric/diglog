import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/OutputKTable.dart';
import 'package:diglog/widgets/OutputMyTable.dart';
import 'package:diglog/widgets/OutputExpression.dart';

//Provider
import 'package:provider/provider.dart';
import 'package:diglog/appState.dart';

class OutputPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);

    expressionType and = appState.and;
    expressionType or = appState.or;
    expressionType not = appState.not;

    if (appState.varNames == null ||
        appState.states == null ||
        appState.varNames.length == 0 ||
        appState.states.length == 0) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutputExpression(
            states: appState.states,
            varNames: appState.varNames,
            and: and,
            or: or,
            not: not,
          ),
        ),
        Visibility(
          visible: appState.inputType != typeEnum.ktable,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutputKTable(
              states: appState.states,
              varNames: appState.varNames,
            ),
          ),
        ),
        Visibility(
          visible: appState.inputType != typeEnum.table,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutputMyTable(
              states: appState.states,
              varNames: appState.varNames,
            ),
          ),
        ),
      ],
    );
  }
}
