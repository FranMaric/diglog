import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/KTable.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: KTable(
        variableNames: ["A", "B", "C", "D"],
        states: [0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      ),
    );
  }
}
