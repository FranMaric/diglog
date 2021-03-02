import 'package:diglog/appState.dart';
import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/InputExpression.dart';
import 'package:diglog/widgets/InputKTable.dart';
import 'package:diglog/widgets/InputMyTable.dart';
import 'package:provider/provider.dart';

enum typeEnum { expression, ktable, table } //ENUM

class InputPane extends StatefulWidget {
  @override
  _InputPaneState createState() => _InputPaneState();
}

class _InputPaneState extends State<InputPane> {
  typeEnum inputType = typeEnum.expression; //default input type

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 20),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  inputType = typeEnum.expression;
                });
              },
              child: Text(
                "Expression",
              ),
            ),
            SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  if (inputType == typeEnum.expression)
                    Provider.of<AppState>(context, listen: false)
                        .setDefaultValues();
                  inputType = typeEnum.ktable;
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
                  if (inputType == typeEnum.expression)
                    Provider.of<AppState>(context, listen: false)
                        .setDefaultValues();
                  inputType = typeEnum.table;
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
                if (inputType == typeEnum.expression)
                  Provider.of<AppState>(context, listen: false).reset();
                else
                  Provider.of<AppState>(context, listen: false)
                      .setDefaultValues();
              },
              child: Text(
                "Reset",
              ),
            ),
          ],
        ),
        SizedBox(height: 7),
        (inputType == typeEnum.ktable || inputType == typeEnum.table)
            ? Row(
                children: [
                  SizedBox(width: 10),
                  Text(Provider.of<AppState>(context)
                          .varNames
                          .length
                          .toString() +
                      " variables"),
                  SizedBox(width: 10),
                  RoundIconButton(
                    icon: Icons.exposure_minus_1,
                    onTap: () => Provider.of<AppState>(context, listen: false)
                        .decrementVarCount(),
                  ),
                  SizedBox(width: 10),
                  RoundIconButton(
                    icon: Icons.plus_one,
                    onTap: () => Provider.of<AppState>(context, listen: false)
                        .incrementVarCount(),
                  ),
                  SizedBox(width: 10),
                ],
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: inputType == typeEnum.expression
              ? InputExpression()
              : (inputType == typeEnum.ktable ? InputKTable() : InputMyTable()),
        ),
        inputType == typeEnum.expression
            ? Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: OutlinedButton(
                  onPressed: () => Provider.of<AppState>(context, listen: false)
                      .submitStates(),
                  child: Text(
                    "Calculate",
                  ),
                ),
              )
            : Container(),
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
