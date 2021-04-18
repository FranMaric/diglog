import 'package:flutter/material.dart';

//Widgets
import 'package:diglog/widgets/LinkButton.dart';

//Provider
import 'package:provider/provider.dart';
import 'package:diglog/services/appState.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    int highlightRow = -1;

    if (appState.and == appState.or && appState.or == appState.not) {
      if (appState.and == expressionType.literal)
        highlightRow = 0;
      else if (appState.and == expressionType.algebraic)
        highlightRow = 1;
      else if (appState.and == expressionType.logical)
        highlightRow = 2;
      else if (appState.and == expressionType.programming) highlightRow = 3;
    }

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Tooltip(
                message: "Customize the output to your liking :)",
                child: Text(
                  "Customize output:",
                ),
              ),
            ),
            Table(
              // defaultColumnWidth: IntrinsicColumnWidth(),
              columnWidths: {
                0: IntrinsicColumnWidth(),
              },
              border: TableBorder.symmetric(
                inside: BorderSide(width: 0.8, color: Colors.blue),
              ),
              children: [
                MyTableRow(
                    title: "Literal",
                    titles: ["and", "or", "not"],
                    highlight: highlightRow == 0,
                    highlights: [
                      appState.and == expressionType.literal,
                      appState.or == expressionType.literal,
                      appState.not == expressionType.literal,
                    ],
                    onBigTap: () {
                      Provider.of<AppState>(context, listen: false)
                          .setCurrentOutputType(
                              newAnd: expressionType.literal,
                              newNot: expressionType.literal,
                              newOr: expressionType.literal);
                    },
                    onSmallTap: (int i) {
                      if (i == 0) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newAnd: expressionType.literal);
                      } else if (i == 1) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newOr: expressionType.literal);
                      } else if (i == 2) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newNot: expressionType.literal);
                      }
                    }),
                MyTableRow(
                    title: "Algebraic",
                    titles: ["*", "+", "!"],
                    highlight: highlightRow == 1,
                    highlights: [
                      appState.and == expressionType.algebraic,
                      appState.or == expressionType.algebraic,
                      appState.not == expressionType.algebraic,
                    ],
                    onBigTap: () {
                      Provider.of<AppState>(context, listen: false)
                          .setCurrentOutputType(
                              newAnd: expressionType.algebraic,
                              newNot: expressionType.algebraic,
                              newOr: expressionType.algebraic);
                    },
                    onSmallTap: (int i) {
                      if (i == 0) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newAnd: expressionType.algebraic);
                      } else if (i == 1) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newOr: expressionType.algebraic);
                      } else if (i == 2) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newNot: expressionType.algebraic);
                      }
                    }),
                MyTableRow(
                    title: "Logical",
                    titles: ["^", "ˇ", "¬"],
                    highlight: highlightRow == 2,
                    highlights: [
                      appState.and == expressionType.logical,
                      appState.or == expressionType.logical,
                      appState.not == expressionType.logical,
                    ],
                    onBigTap: () {
                      Provider.of<AppState>(context, listen: false)
                          .setCurrentOutputType(
                              newAnd: expressionType.logical,
                              newNot: expressionType.logical,
                              newOr: expressionType.logical);
                    },
                    onSmallTap: (int i) {
                      if (i == 0) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newAnd: expressionType.logical);
                      } else if (i == 1) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newOr: expressionType.logical);
                      } else if (i == 2) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newNot: expressionType.logical);
                      }
                    }),
                MyTableRow(
                    title: "Programming",
                    titles: ["&&", "||", "~"],
                    highlight: highlightRow == 3,
                    highlights: [
                      appState.and == expressionType.programming,
                      appState.or == expressionType.programming,
                      appState.not == expressionType.programming,
                    ],
                    onBigTap: () {
                      Provider.of<AppState>(context, listen: false)
                          .setCurrentOutputType(
                              newAnd: expressionType.programming,
                              newNot: expressionType.programming,
                              newOr: expressionType.programming);
                    },
                    onSmallTap: (int i) {
                      if (i == 0) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newAnd: expressionType.programming);
                      } else if (i == 1) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newOr: expressionType.programming);
                      } else if (i == 2) {
                        Provider.of<AppState>(context, listen: false)
                            .setCurrentOutputType(
                                newNot: expressionType.programming);
                      }
                    }),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            ListTile(
              title: Tooltip(
                  message: "Adds spaces between operators",
                  child: Text("Spaces")),
              trailing: Switch(
                value: Provider.of<AppState>(context).addSpaces,
                onChanged: (bool value) =>
                    Provider.of<AppState>(context, listen: false)
                        .setAddSpaces(value),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            LinkButton(
              text: "Made by Fran Marić",
              url: "https://github.com/FranMaric",
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
TableRow MyTableRow(
    {String title,
    List<String> titles,
    bool highlight,
    List<bool> highlights,
    Function onBigTap,
    Function onSmallTap}) {
  return TableRow(
    children: [
          RowItem(
            title: title,
            onTap: onBigTap,
            alignment: Alignment.centerLeft,
            highlight: highlight,
          )
        ] +
        List.generate(
          titles.length,
          (i) => RowItem(
            title: titles[i],
            onTap: () => onSmallTap(i),
            highlight: highlights[i],
          ),
        ),
  );
}

class RowItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final Alignment alignment;
  final bool highlight;

  RowItem(
      {this.onTap,
      this.title,
      this.highlight = false,
      this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue[100],
      child: Container(
        color: highlight ? Colors.blue[100] : Colors.white70,
        alignment: alignment,
        padding: EdgeInsets.all(2.0),
        child: Text(title),
      ),
    );
  }
}
