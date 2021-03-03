import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:diglog/functions/statesToExpression.dart';

class OutputExpression extends StatelessWidget {
  final List<String> varNames;
  final List<int> states;

  final and;
  final or;
  final not;

  OutputExpression({this.varNames, this.states, this.and, this.or, this.not});

  @override
  Widget build(BuildContext context) {
    String expression = statesToExpression(states, varNames, and, or, not);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white70,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      padding: EdgeInsets.only(left: 12, right: 3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            expression,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(width: 12.0),
          Container(
            width: 1,
            height: 55,
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: expression));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Copied to Clipboard'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
