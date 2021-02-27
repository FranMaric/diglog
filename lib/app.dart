import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/InputPane.dart';
import 'package:diglog/widgets/OutputPane.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                  child: InputPane(),
                ),
                Expanded(
                  child: OutputPane(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
