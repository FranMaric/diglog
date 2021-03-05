import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:diglog/app.dart';

//Provider
import 'package:provider/provider.dart';
import 'package:diglog/services/appState.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'DigLog',
        debugShowCheckedModeBanner: false,
        home: App(),
      ),
    ),
  );
}
