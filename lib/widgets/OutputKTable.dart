import 'package:flutter/material.dart';
import 'dart:math';

//Function
import 'package:diglog/functions/grayCode.dart';
import 'package:diglog/functions/stateDecoder.dart';

class OutputKTable extends StatelessWidget {
  final List<String> varNames;
  final List<int> states;

  OutputKTable({this.varNames, this.states});

  @override
  Widget build(BuildContext context) {
    int xVar = (varNames.length / 2).ceil();
    int yVar = varNames.length - xVar;

    int x = pow(2, xVar);
    int y = yVar == 0 ? 0 : pow(2, yVar);

    List<String> xGrayCodes = grayCode(xVar);
    List<String> yGrayCodes = grayCode(yVar);

    List<int> stateDecode = stateDecoder(xVar, yVar);

    double cellWidth;
    double cellHeight;

    switch (xVar) {
      case 1:
        cellWidth = 25.0;
        cellHeight = 25.0;
        break;
      default:
        cellWidth = 25.0 * (xVar + .2) / 2.2;
        cellHeight = 25.0 * (xVar + .2) / 2.2;
    }

    if (states.length < x * (y == 0 ? 1 : y)) {
      print("There aren't enough states!");
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: y != 0
              ? Text(
                  varNames.sublist(xVar).join(),
                )
              : Container(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 3),
              child: Text(varNames.sublist(0, xVar).join()),
            ),
            SizedBox(
              height: cellHeight,
              child: Row(
                children: [
                      Container(
                        child: CustomPaint(
                          size: Size(cellWidth, cellHeight),
                          painter: MyPainter(),
                        ),
                      )
                    ] +
                    List.generate(
                      x,
                      (i) => Container(
                        width: cellWidth,
                        child: Center(
                          child: Text(xGrayCodes[i]),
                        ),
                      ),
                    ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: cellWidth,
                  child: Column(
                    children: y == 0
                        ? []
                        : List.generate(
                            y,
                            (i) => Container(
                              height: cellHeight,
                              child: Center(
                                child: Text(yGrayCodes[i]),
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  width: x * cellWidth,
                  height: (y == 0 ? 1 : y) * cellHeight,
                  child: GridView.count(
                    crossAxisCount: x,
                    children: List.generate(
                      states.length,
                      (index) => KTableCell(
                        state: states[stateDecode[index]],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class KTableCell extends StatelessWidget {
  final int state;

  KTableCell({this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.5,
            color: Colors.black,
          ),
        ),
        child: Center(
          child: Text(
            state == 0 ? '0' : '1',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, 0);
    final p2 = Offset(size.width, size.height);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.1;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
