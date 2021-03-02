import 'package:flutter/material.dart';

//Function
import 'package:diglog/functions/intToBinaryString.dart';

//Provider
import 'package:provider/provider.dart';
import 'package:diglog/appState.dart';

double cellWidth = 25.0;
double cellHeight = 18.0;

class InputMyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);

    List<List<String>> columns =
        List.generate(appState.varNames.length, (i) => []);

    for (int i = 0; i < appState.states.length; i++) {
      String row = intToBinaryString(i, appState.varNames.length);
      for (int j = 0; j < appState.varNames.length; j++) columns[j].add(row[j]);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        appState.varNames.length,
        (index) => MyColumn(
          states: columns[index],
          addLeftBoundry: index == 0,
          varName: appState.varNames[index],
        ),
      )..add(
          MyFColumn(
            states: List.generate(
                appState.states.length, (i) => appState.states[i].toString()),
            addLeftBoundry: true,
            varName: "f",
          ),
        ),
    );
  }
}

class MyColumn extends StatelessWidget {
  final List<String> states;
  final String varName;

  final bool addLeftBoundry;
  final bool addRightBoundry;

  MyColumn(
      {this.states,
      this.addLeftBoundry = false,
      this.addRightBoundry = true,
      this.varName = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addLeftBoundry == true
            ? Container(
                width: 1,
                height: states.length * cellHeight + 15,
                color: Colors.black,
              )
            : SizedBox(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
                Text(varName),
                // Flexible(
                //   child: Container(
                //     height: 2,
                //     color: Colors.black,
                //   ),
                // )
              ] +
              List.generate(
                states.length,
                (i) => Cell(states[i]),
              ),
        ),
        addRightBoundry == true
            ? Container(
                width: 1,
                height: states.length * cellHeight + 15,
                color: Colors.black,
              )
            : SizedBox()
      ],
    );
  }
}

class Cell extends StatelessWidget {
  final String value;
  Cell(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth,
      height: cellHeight,
      child: Center(
        child: Text(
          value,
        ),
      ),
    );
  }
}

class MyFColumn extends StatelessWidget {
  final List<String> states;
  final String varName;

  final bool addLeftBoundry;
  final bool addRightBoundry;

  MyFColumn(
      {this.states,
      this.addLeftBoundry = false,
      this.addRightBoundry = true,
      this.varName = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addLeftBoundry == true
            ? Container(
                width: 1,
                height: states.length * cellHeight + 15,
                color: Colors.black,
              )
            : SizedBox(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
                Text(varName),
                // Flexible(
                //   child: Container(
                //     height: 2,
                //     color: Colors.black,
                //   ),
                // )
              ] +
              List.generate(
                states.length,
                (i) => FCell(
                  value: states[i],
                  onTap: () => Provider.of<AppState>(context, listen: false)
                      .updateState(i),
                ),
              ),
        ),
        addRightBoundry == true
            ? Container(
                width: 1,
                height: states.length * cellHeight + 15,
                color: Colors.black,
              )
            : SizedBox()
      ],
    );
  }
}

class FCell extends StatelessWidget {
  final String value;
  final Function onTap;

  FCell({this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: cellWidth,
        height: cellHeight,
        child: Center(
          child: Text(
            value,
          ),
        ),
      ),
    );
  }
}
