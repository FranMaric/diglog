import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/InputSelector.dart';
import 'package:diglog/widgets/OutputPane.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "Function minimizer",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Roboto",
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputSelector(),
              ),
              Expanded(
                child: Column(
                  children: [
                    OutputPane(
                      varNames: ["A", "B", "C"],
                      states: [0, 0, 1, 0, 1, 0, 0, 0],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
