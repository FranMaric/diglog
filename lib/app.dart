import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/InputPane.dart';
import 'package:diglog/widgets/OutputPane.dart';
import 'package:diglog/widgets/MyDrawer.dart';
import 'package:diglog/widgets/MyAppBar.dart';
import 'package:diglog/widgets/LinkButton.dart';

class App extends StatelessWidget {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(),
      backgroundColor: Colors.white,
      body: Scrollbar(
        controller: controller,
        showTrackOnHover: true,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
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
            Positioned(
              bottom: 10,
              right: 10,
              child: LinkButton(
                text: "Report an issue || Request a feature",
                url: "https://github.com/FranMaric/diglog/issues/new",
              ),
            )
          ],
        ),
      ),
    );
  }
}
