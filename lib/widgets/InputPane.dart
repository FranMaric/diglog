import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/InputExpression.dart';
import 'package:diglog/widgets/InputKTable.dart';
import 'package:diglog/widgets/InputMyTable.dart';

class InputPane extends StatefulWidget {
  @override
  _InputPaneState createState() => _InputPaneState();
}

class _InputPaneState extends State<InputPane> {
  int inputType = 0;
  // 0 - Boolean
  // 1 - KTable
  // 2 - Table

  int variables = 2;

  List<int> states;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Text(
            "Choose input:",
          ),
        ),
        Row(
          children: [
            SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  inputType = 0;
                });
              },
              child: Text(
                "Boolean",
              ),
            ),
            SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  inputType = 1;
                });
              },
              child: Text(
                "KTable",
              ),
            ),
            SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  inputType = 2;
                });
              },
              child: Text(
                "Table",
              ),
            ),
            SizedBox(width: 10),
            Container(width: 1, height: 20, color: Colors.blueGrey),
            SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {
                print("RESET"); // ADD reset functionality
              },
              child: Text(
                "Reset",
              ),
            ),
          ],
        ),
        SizedBox(height: 7),
        (inputType == 1 || inputType == 2)
            ? Row(
                children: [
                  SizedBox(width: 10),
                  Text(variables.toString() + " variables"),
                  SizedBox(width: 10),
                  RoundIconButton(
                    icon: Icons.exposure_minus_1,
                    onTap: () => setState(() {
                      if (variables > 2) variables--;
                    }),
                  ),
                  SizedBox(width: 10),
                  RoundIconButton(
                    icon: Icons.plus_one,
                    onTap: () => setState(() {
                      if (variables < 10) variables++;
                    }),
                  ),
                  SizedBox(width: 10),
                ],
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: inputType == 0
              ? InputExpression()
              : (inputType == 1 ? InputKTable() : InputMyTable()),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: OutlinedButton(
            onPressed: () {
              print("Calculate"); // ADD calculate funcionality
            },
            child: Text(
              "Calculate",
            ),
          ),
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  RoundIconButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey[300],
            width: 1.5,
          ),
          color: Colors.white,
        ),
        child: InkWell(
          child: Icon(
            icon,
            size: 19.0,
            color: Colors.blue[400], // button color
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
