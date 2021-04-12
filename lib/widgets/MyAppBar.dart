import 'package:flutter/material.dart';

class MyAppBar extends PreferredSize {
  final double height;

  MyAppBar({this.height = 50.0});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
