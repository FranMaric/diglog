import 'package:flutter/material.dart';

//Function
import 'package:diglog/functions/intToBinaryString.dart';

double cellWidth = 25.0;
double cellHeight = 18.0;

class OutputMyTable extends StatelessWidget {
  final List<String> varNames;
  final List<int> states;

  OutputMyTable({this.varNames, this.states});

  @override
  Widget build(BuildContext context) {
    List<List<String>> columns = List.generate(varNames.length, (i) => []);

    for (int i = 0; i < states.length; i++) {
      String row = intToBinaryString(i, varNames.length);
      for (int j = 0; j < varNames.length; j++) columns[j].add(row[j]);
    }
    return Row(
      children: List.generate(
        varNames.length,
        (index) => MyColumn(
          states: columns[index],
          addLeftBoundry: index == 0,
          varName: varNames[index],
        ),
      )..add(
          MyColumn(
            states: List.generate(states.length, (i) => states[i].toString()),
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
