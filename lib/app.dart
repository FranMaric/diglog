import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/InputPane.dart';
import 'package:diglog/widgets/OutputPane.dart';
import 'package:diglog/widgets/MyDrawer.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Boolean function minimizer",
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 680)
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InputPane(),
                ),
                Expanded(
                  child: OutputPane(),
                ),
              ],
            );
          else
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputPane(),
                OutputPane(),
              ],
            );
        }),
      ),
    );
  }
}
