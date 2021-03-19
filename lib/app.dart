import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/InputPane.dart';
import 'package:diglog/widgets/OutputPane.dart';
import 'package:diglog/widgets/MyDrawer.dart';

class App extends StatelessWidget {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Boolean function minimizer",
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: 'Settings',
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Scrollbar(
        controller: controller,
        showTrackOnHover: true,
        child: SingleChildScrollView(
          controller: controller,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 782)
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
      ),
    );
  }
}
